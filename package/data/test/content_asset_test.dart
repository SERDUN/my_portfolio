import 'dart:io';

import 'package:test/test.dart';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

void main() {
  test('every content file exists for every language', () {
    final missing = [
      for (final language in Language.values)
        for (final asset in ContentAsset.values)
          if (!File(asset.path(language)).existsSync()) asset.path(language),
    ];
    expect(missing, isEmpty, reason: 'a language without its content files');
  });

  test('a path names the language directory and the file', () {
    expect(ContentAsset.usefulCommands.path(Language.uk), 'assets/data/uk/useful_commands.json');
  });
}
