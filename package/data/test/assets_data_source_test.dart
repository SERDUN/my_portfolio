import 'package:flutter_test/flutter_test.dart';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

/// Loads the bundled JSON through [AssetsDataSource], i.e. through
/// `rootBundle` under the `packages/data/...` prefix the app uses at runtime.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final dataSource = AssetsDataSource();

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
    expect(dataSource.getProject('no-such-id', Language.en), throwsStateError);
  });
}
