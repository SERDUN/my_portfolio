import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

import 'package:my_portfolio/di/injection.dart';

/// Wires the real container (root config + the `data` and `domain` micro
/// package modules) and resolves everything the router asks for. A module
/// that is not listed in `externalPackageModulesAfter`, or a use case with an
/// unregistered dependency, fails here instead of at the first navigation.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GetIt di;

  setUp(() async {
    di = await configureDependencies(DataEnvironment.assets);
  });

  test('resolves every use case the router asks for', () {
    expect(di<GetUserUseCase>(), isA<GetUserUseCase>());
    expect(di<GetUserSkillsUseCase>(), isA<GetUserSkillsUseCase>());
    expect(di<GetProjectsUseCase>(), isA<GetProjectsUseCase>());
    expect(di<GetProjectByIdUseCase>(), isA<GetProjectByIdUseCase>());
    expect(di<GetContactsUseCase>(), isA<GetContactsUseCase>());
    expect(di<GetUsefulCommandsUseCase>(), isA<GetUsefulCommandsUseCase>());
  });

  test('registers the data package repositories behind the domain interfaces', () {
    expect(di<UserRepository>(), isA<UserRepository>());
    expect(di<ProjectRepository>(), isA<ProjectRepository>());
    expect(di<UsefulRepository>(), isA<UsefulRepository>());
  });

  test('the assets environment binds the bundled JSON as the data source', () {
    expect(di<PortfolioDataSource>(), isA<AssetsDataSource>());
    expect(di<PortfolioDataSource>(), same(di<AssetsDataSource>()));
  });

  test('the api environment binds the API as the data source', () async {
    final api = await configureDependencies(DataEnvironment.api);

    expect(api<PortfolioDataSource>(), isA<FallbackDataSource>());
    expect(api<UsefulRepository>(), isA<UsefulRepository>(), reason: 'commands still come from assets');
  });

  group('DataEnvironment.fromName', () {
    test('accepts the known names in any case and defaults an empty value to assets', () {
      expect(DataEnvironment.fromName(''), DataEnvironment.assets);
      expect(DataEnvironment.fromName('assets'), DataEnvironment.assets);
      expect(DataEnvironment.fromName(' API '), DataEnvironment.api);
    });

    test('rejects an unknown name', () {
      expect(() => DataEnvironment.fromName('server'), throwsArgumentError);
    });
  });

  test('every call returns an independent container', () async {
    final other = await configureDependencies(DataEnvironment.assets);

    expect(other, isNot(same(di)));
    // Singletons are per container: a shared container would hand out the same instances.
    expect(other<AssetsDataSource>(), isNot(same(di<AssetsDataSource>())));
    expect(other<PortfolioDataSource>(), isNot(same(di<PortfolioDataSource>())));
  });

  group('use cases read the bundled assets end to end', () {
    test('user and skills', () async {
      final user = await di<GetUserUseCase>().execute(language: Language.en).first;
      final skills = await di<GetUserSkillsUseCase>().execute(language: Language.en).first;

      expect(user.firstName, isNotEmpty);
      expect(user.secondName, isNotEmpty);
      expect(skills, isNotEmpty);
    });

    test('projects, project by id, contacts and useful commands', () async {
      final projects = await di<GetProjectsUseCase>().execute(language: Language.en).first;
      expect(projects, isNotEmpty);

      final project = await di<GetProjectByIdUseCase>().execute(id: projects.first.id, language: Language.en).first;
      expect(project.name, projects.first.name);

      expect(await di<GetContactsUseCase>().execute(language: Language.en).first, isNotEmpty);
      expect(await di<GetUsefulCommandsUseCase>().execute(language: Language.en).first, isNotEmpty);
    });

    test('asking for uk serves the Ukrainian assets', () async {
      final english = await di<GetUserUseCase>().execute(language: Language.en).first;
      final ukrainian = await di<GetUserUseCase>().execute(language: Language.uk).first;

      expect(ukrainian.intro, isNotEmpty);
      expect(ukrainian.intro, isNot(english.intro));
    });
  });
}
