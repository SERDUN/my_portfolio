import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/app_environment_keys.dart';
import 'package:my_portfolio/di/injection.dart';

/// Wires the real container (root config + the `data` and `domain` micro
/// package modules) and resolves everything the router asks for. A module
/// that is not listed in `externalPackageModulesAfter`, or a use case with an
/// unregistered dependency, fails here instead of at the first navigation.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GetIt di;

  setUp(() async {
    di = await configureDependencies(AppEnvironmentKey.dev);
  });

  test('resolves every use case the router asks for', () {
    expect(di<GetUserUseCase>(), isA<GetUserUseCase>());
    expect(di<GetUserSkillsUseCase>(), isA<GetUserSkillsUseCase>());
    expect(di<GetProjectsUseCase>(), isA<GetProjectsUseCase>());
    expect(di<GetProjectByIdUseCase>(), isA<GetProjectByIdUseCase>());
    expect(di<GetContactsUseCase>(), isA<GetContactsUseCase>());
    expect(di<GetUsefulCommandsUseCase>(), isA<GetUsefulCommandsUseCase>());
  });

  test('resolves the shared Config as a singleton used by the language switch', () {
    final config = di<Config>();

    expect(config, same(di<Config>()));
    expect(config.currentLocale, 'en');
  });

  test('registers the data package repositories behind the domain interfaces', () {
    expect(di<UserRepository>(), isA<UserRepository>());
    expect(di<ProjectRepository>(), isA<ProjectRepository>());
    expect(di<UsefulRepository>(), isA<UsefulRepository>());
    expect(di<bool>(instanceName: 'hasLocalSync'), isTrue);
    expect(di<bool>(instanceName: 'hasServerSync'), isFalse);
  });

  test('every call returns an independent container', () async {
    final other = await configureDependencies(AppEnvironmentKey.dev);

    expect(other, isNot(same(di)));
    expect(other<Config>(), isNot(same(di<Config>())));
  });

  group('use cases read the bundled assets end to end', () {
    test('user and skills', () async {
      final user = await di<GetUserUseCase>().execute().first;
      final skills = await di<GetUserSkillsUseCase>().execute().first;

      expect(user.firstName, isNotEmpty);
      expect(user.secondName, isNotEmpty);
      expect(skills, isNotEmpty);
    });

    test('projects, project by id, contacts and useful commands', () async {
      final projects = await di<GetProjectsUseCase>().execute().first;
      expect(projects, isNotEmpty);

      final project = await di<GetProjectByIdUseCase>().execute(id: projects.first.id!).first;
      expect(project.name, projects.first.name);

      expect(await di<GetContactsUseCase>().execute().first, isNotEmpty);
      expect(await di<GetUsefulCommandsUseCase>().execute().first, isNotEmpty);
    });

    test('switching Config to uk serves the Ukrainian assets', () async {
      final english = await di<GetUserUseCase>().execute().first;
      di<Config>().setCurrentLocale = 'uk';
      final ukrainian = await di<GetUserUseCase>().execute().first;

      expect(ukrainian.intro, isNotEmpty);
      expect(ukrainian.intro, isNot(english.intro));
    });
  });
}
