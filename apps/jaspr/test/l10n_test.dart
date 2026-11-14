import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import 'package:my_portfolio_jaspr/l10n/app_strings.g.dart';

/// The generated strings against the ARB files they come from. `dart test`
/// runs in apps/jaspr, so the ARB directory is two levels up.
void main() {
  Map<String, dynamic> arb(String code) =>
      jsonDecode(File('../../lib/localization/l10n/arb/app_$code.arb').readAsStringSync()) as Map<String, dynamic>;

  test('there is a set of strings for every ARB file', () {
    final codes = Directory('../../lib/localization/l10n/arb')
        .listSync()
        .map((f) => RegExp(r'app_(\w+)\.arb$').firstMatch(f.path)?.group(1))
        .whereType<String>()
        .toSet();
    expect(AppStrings.languageCodes.toSet(), codes);
    for (final code in codes) {
      expect(AppStrings.of(code).languageCode, code);
    }
  });

  test('an unknown language falls back to English', () {
    expect(AppStrings.of('de').languageCode, 'en');
  });

  test('a plain message is the ARB text', () {
    for (final code in AppStrings.languageCodes) {
      expect(AppStrings.of(code).common_downloadCv, arb(code)['common_downloadCv']);
    }
  });

  test('a message with placeholders interpolates its typed arguments', () {
    for (final code in AppStrings.languageCodes) {
      final strings = AppStrings.of(code);
      expect(
        strings.projects_title(13, 2),
        (arb(code)['projects_title'] as String).replaceAll('{count}', '13').replaceAll('{platforms}', '2'),
      );
      expect(
        strings.contacts_semanticsLabel_openChannel('Email', 'a@b.c'),
        (arb(code)['contacts_semanticsLabel_openChannel'] as String)
            .replaceAll('{title}', 'Email')
            .replaceAll('{value}', 'a@b.c'),
      );
    }
  });
}
