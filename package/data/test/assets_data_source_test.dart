import 'package:test/test.dart';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

import 'support/file_asset_loader.dart';

/// Loads the bundled JSON through [AssetsDataSource] and an [AssetLoader]
/// that reads the files from disk.
void main() {
  final dataSource = AssetsDataSource(const FileAssetLoader());

  for (final language in Language.values) {
    group('AssetsDataSource($language)', () {
      test('getUser returns the bundled user', () async {
        final user = await dataSource.getUser(language);

        expect(user.firstName, isNotEmpty);
        expect(user.secondName, isNotEmpty);
      });

      test('getProjects and getProject agree', () async {
        final projects = await dataSource.getProjects(language);

        expect(projects, isNotEmpty);
        final first = projects.first;
        final byId = await dataSource.getProject(first.id!, language);
        expect(byId.name, first.name);
      });

      test('getContacts, getSkills and getUsefulCommand return data', () async {
        expect(await dataSource.getContacts(language), isNotEmpty);
        expect(await dataSource.getSkills(language), isNotEmpty);
        expect(await dataSource.getUsefulCommand(language), isNotEmpty);
      });
    });
  }

  test('each language serves its own content', () async {
    final english = await dataSource.getUser(Language.en);
    final ukrainian = await dataSource.getUser(Language.uk);

    expect(ukrainian.intro, isNot(english.intro));
  });

  test('getProject throws for an unknown id', () async {
    expect(dataSource.getProject('no-such-id', Language.en), throwsA(isA<ProjectNotFoundException>()));
  });
}
