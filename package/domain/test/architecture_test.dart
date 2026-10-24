import 'dart:io';

import 'package:test/test.dart';

/// The domain package is the contract everything else depends on, so it may
/// know nothing about Flutter, the data package or serialization. A violation
/// here fails the build instead of waiting for a review to spot it. Generated
/// files are checked too: the DI module is exactly where a stray dependency
/// used to resurface.
void main() {
  final libFiles = Directory('lib')
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .toList();

  List<String> offendersMatching(RegExp pattern) => [
        for (final file in libFiles)
          for (final line in file.readAsLinesSync())
            if (pattern.hasMatch(line)) '${file.path}: ${line.trim()}',
      ];

  test('lib/ has no Flutter, data, http or serialization imports or exports', () {
    final forbidden = RegExp(
      '''(import|export)\\s+['"]package:(flutter|material_ui|data|http|json_annotation|json_serializable)/''',
    );
    expect(offendersMatching(forbidden), isEmpty, reason: 'domain must not depend on the layers above or below it');
  });

  test('lib/ does not name DTOs', () {
    expect(
      offendersMatching(RegExp(r'\b[A-Za-z]+DTO\b')),
      isEmpty,
      reason: 'repository contracts and use cases speak in domain models only',
    );
  });

  test('pubspec declares neither flutter nor data as a dependency', () {
    final lines = File('pubspec.yaml').readAsLinesSync();
    final start = lines.indexWhere((l) => l.trim() == 'dependencies:');
    expect(start, isNonNegative, reason: 'pubspec has a dependencies section');
    final dependencyNames = <String>[];
    for (final line in lines.skip(start + 1)) {
      if (line.isNotEmpty && !line.startsWith(' ')) break;
      final match = RegExp(r'^  ([a-z_]+):').firstMatch(line);
      if (match != null) dependencyNames.add(match.group(1)!);
    }
    expect(dependencyNames, isNot(contains('flutter')));
    expect(dependencyNames, isNot(contains('data')));
  });
}
