import 'package:flutter_test/flutter_test.dart';

import 'package:data/data.dart';

/// Loads the bundled JSON through [AssetsDataSource], i.e. through
/// `rootBundle` under the `packages/data/...` prefix the app uses at runtime.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final dataSource = AssetsDataSource();

  for (final language in ['en', 'uk']) {
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

  test('an unsupported locale falls back to English', () async {
    final fallback = await dataSource.getUser('de');
    final english = await dataSource.getUser('en');

    expect(fallback.intro, english.intro);
  });

  test('getProject throws for an unknown id', () async {
    expect(dataSource.getProject('no-such-id', 'en'), throwsStateError);
  });
}
