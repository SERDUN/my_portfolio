// Generates the Jaspr presenter's strings from the SAME ARB files the Flutter
// app uses (lib/localization/l10n/arb/).
//
// Flutter's gen-l10n output imports package:flutter, so a presenter that
// compiles to JavaScript cannot use it. Rather than let the Jaspr side keep its
// own copy of the strings, this reads the ARB files and writes plain Dart:
// an abstract `AppStrings` with one member per key, named exactly as the
// Flutter `AppLocalizations` names it, and one class per locale.
//
// Placeholders: a message with `{name}` becomes a method with a typed
// parameter per placeholder (the `@key.placeholders` types; String when
// untyped), which interpolates - the same thing gen-l10n does for such a
// message. ICU plural and select are refused by name: they need per-locale
// plural rules, and a plain substitution would produce wrong Ukrainian.
//
// Every locale must carry every key of the template with the same
// placeholders; a gap fails the run instead of falling back silently.
//
// Usage (from the repository root): dart tool/scripts/gen_jaspr_l10n.dart
// tool/scripts/jaspr.sh runs it before every build, serve, test and analyze;
// the output is not committed.
import 'dart:convert';
import 'dart:io';

const _arbDir = 'lib/localization/l10n/arb';
const _template = 'en';
const _output = 'apps/jaspr/lib/l10n/app_strings.g.dart';

void main() {
  final locales = _readLocales();
  final template = locales[_template];
  if (template == null) _fail('$_arbDir/app_$_template.arb is missing: it is the template');

  final metadata = jsonDecode(File('$_arbDir/app_$_template.arb').readAsStringSync()) as Map<String, dynamic>;
  final keys = template.keys.toList();
  final params = {for (final key in keys) key: _placeholders(key, template[key]!, metadata)};

  for (final MapEntry(key: locale, value: messages) in locales.entries) {
    final missing = keys.where((k) => !messages.containsKey(k)).toList();
    if (missing.isNotEmpty) _fail('app_$locale.arb lacks ${missing.join(', ')}');
    final extra = messages.keys.where((k) => !template.containsKey(k)).toList();
    if (extra.isNotEmpty) _fail('app_$locale.arb has keys the template does not: ${extra.join(', ')}');
    for (final key in keys) {
      final used = _names(messages[key]!);
      final declared = params[key]!.map((p) => p.name).toSet();
      if (used.difference(declared).isNotEmpty || (locale == _template && declared.difference(used).isNotEmpty)) {
        _fail('$key in app_$locale.arb uses {${used.join(', ')}}, the template declares {${declared.join(', ')}}');
      }
    }
  }

  File(_output)
    ..createSync(recursive: true)
    ..writeAsStringSync(_render(keys, params, locales));
  final format = Process.runSync('dart', ['format', '--line-length', '120', _output]);
  if (format.exitCode != 0) _fail('dart format failed on $_output: ${format.stderr}');
  stdout.writeln('wrote $_output (${keys.length} strings x ${locales.length} locales)');
}

class _Param {
  const _Param(this.name, this.type);
  final String name;
  final String type;
}

/// locale -> (key -> message), template first, then alphabetical.
Map<String, Map<String, String>> _readLocales() {
  final files = Directory(_arbDir).listSync().whereType<File>().where((f) => f.path.endsWith('.arb')).toList()
    ..sort((a, b) => a.path.compareTo(b.path));
  final locales = <String, Map<String, String>>{};
  for (final file in files) {
    final locale = RegExp(r'app_(\w+)\.arb$').firstMatch(file.path)?.group(1);
    if (locale == null) continue;
    final decoded = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    locales[locale] = {
      for (final entry in decoded.entries)
        if (!entry.key.startsWith('@')) entry.key: entry.value as String,
    };
  }
  final template = locales.remove(_template);
  return {_template: ?template, ...locales};
}

final _placeholder = RegExp(r'\{(\w+)\}');
final _icu = RegExp(r'\{\s*\w+\s*,\s*(plural|select|selectordinal)\s*,');

Set<String> _names(String message) => {for (final m in _placeholder.allMatches(message)) m.group(1)!};

List<_Param> _placeholders(String key, String message, Map<String, dynamic> metadata) {
  final icu = _icu.firstMatch(message);
  if (icu != null) _fail('$key is an ICU ${icu.group(1)}: not supported by the Jaspr strings yet');
  final declared = ((metadata['@$key'] as Map<String, dynamic>?)?['placeholders'] as Map<String, dynamic>?) ?? {};
  return [
    for (final name in _names(message))
      _Param(name, switch ((declared[name] as Map<String, dynamic>?)?['type']) {
        'int' => 'int',
        'double' || 'num' => 'num',
        _ => 'String',
      }),
  ];
}

/// A Dart single-quoted literal of [message] with each placeholder
/// interpolated.
String _literal(String message) {
  final escaped = message
      .replaceAll(r'\', r'\\')
      .replaceAll("'", r"\'")
      .replaceAll(r'$', r'\$')
      .replaceAll('\n', r'\n');
  return "'${escaped.replaceAllMapped(_placeholder, (m) => '\${${m.group(1)}}')}'";
}

String _className(String locale) => 'AppStrings${locale[0].toUpperCase()}${locale.substring(1)}';

String _render(List<String> keys, Map<String, List<_Param>> params, Map<String, Map<String, String>> locales) {
  String signature(String key) {
    final p = params[key]!;
    return p.isEmpty ? 'String get $key' : 'String $key(${p.map((x) => '${x.type} ${x.name}').join(', ')})';
  }

  final out = StringBuffer()
    ..writeln('// GENERATED by tool/scripts/gen_jaspr_l10n.dart from $_arbDir. Do not edit.')
    ..writeln('// ignore_for_file: non_constant_identifier_names, type=lint')
    ..writeln()
    ..writeln('/// The UI strings of one language, named as the Flutter app\'s AppLocalizations names them.')
    ..writeln('abstract class AppStrings {')
    ..writeln('  const AppStrings();')
    ..writeln()
    ..writeln('  /// The language code this set is written in.')
    ..writeln('  String get languageCode;')
    ..writeln()
    ..writeln('  /// The languages there are strings for, the template first.')
    ..writeln('  static const List<String> languageCodes = [${locales.keys.map((l) => "'$l'").join(', ')}];')
    ..writeln()
    ..writeln('  /// The strings for [code]; the template language for a code there are none for.')
    ..writeln('  static AppStrings of(String code) => switch (code) {');
  for (final locale in locales.keys) {
    out.writeln("    '$locale' => const ${_className(locale)}(),");
  }
  out
    ..writeln('    _ => const ${_className(_template)}(),')
    ..writeln('  };')
    ..writeln();
  for (final key in keys) {
    out
      ..writeln('  ${signature(key)};')
      ..writeln();
  }
  out.writeln('}');

  for (final MapEntry(key: locale, value: messages) in locales.entries) {
    out
      ..writeln()
      ..writeln('class ${_className(locale)} extends AppStrings {')
      ..writeln('  const ${_className(locale)}();')
      ..writeln()
      ..writeln('  @override')
      ..writeln("  String get languageCode => '$locale';");
    for (final key in keys) {
      out
        ..writeln()
        ..writeln('  @override')
        ..writeln('  ${signature(key)} => ${_literal(messages[key]!)};');
    }
    out.writeln('}');
  }
  return out.toString();
}

Never _fail(String message) {
  stderr.writeln('gen_jaspr_l10n: $message');
  exit(1);
}
