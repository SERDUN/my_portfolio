import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

/// In-memory repositories that record the localization they were asked for
/// and serve canned DTOs; no network, no assets.
class FakeUserRepository implements UserRepository {
  final List<String> requestedLocales = [];

  PortfolioUserDTO user = PortfolioUserDTO(firstName: 'Dmitro', secondName: 'Serdun');
  List<PortfolioSkillsDTO> skills = [PortfolioSkillsDTO(title: 'Flutter')];
  List<ContactsDTO> contacts = [ContactsDTO('Email', 'me@example.com')];

  @override
  Stream<PortfolioUserDTO> getUser(String localization) {
    requestedLocales.add(localization);
    return Stream.value(user);
  }

  @override
  Stream<List<PortfolioSkillsDTO>> getSkills(String localization) {
    requestedLocales.add(localization);
    return Stream.value(skills);
  }

  @override
  Stream<List<ContactsDTO>> getContacts(String localization) {
    requestedLocales.add(localization);
    return Stream.value(contacts);
  }
}

class FakeProjectRepository implements ProjectRepository {
  final List<String> requestedLocales = [];
  final List<String> requestedIds = [];

  List<ProjectDTO> projects = [
    ProjectDTO(id: '0', name: 'First', description: ' padded '),
    ProjectDTO(id: '1', name: 'Second'),
  ];

  @override
  Stream<List<ProjectDTO>> getProjects(String localization) {
    requestedLocales.add(localization);
    return Stream.value(projects);
  }

  @override
  Stream<ProjectDTO> getProjectById(String id, String localization) {
    requestedLocales.add(localization);
    requestedIds.add(id);
    final match = projects.where((p) => p.id == id);
    if (match.isEmpty) return Stream.error(StateError('no project $id'));
    return Stream.value(match.first);
  }
}

class FakeUsefulRepository implements UsefulRepository {
  final List<String> requestedLocales = [];

  @override
  Stream<List<UsefulCommandsDTO>> getUsefulCommands(String localization) {
    requestedLocales.add(localization);
    return Stream.value([
      UsefulCommandsDTO('Git', [UsefulCommandDTO('Status', 'git status')]),
    ]);
  }
}

void main() {
  late Config config;
  late FakeUserRepository userRepository;
  late FakeProjectRepository projectRepository;
  late FakeUsefulRepository usefulRepository;

  setUp(() {
    config = Config();
    userRepository = FakeUserRepository();
    projectRepository = FakeProjectRepository();
    usefulRepository = FakeUsefulRepository();
  });

  group('Config', () {
    test('defaults to English and normalizes unsupported locales', () {
      expect(config.currentLocale, 'en');

      config.setCurrentLocale = 'uk';
      expect(config.currentLocale, 'uk');

      config.setCurrentLocale = 'de';
      expect(config.currentLocale, 'en');
    });
  });

  group('LanguageTools', () {
    test('knows the supported languages', () {
      expect(LanguageTools.isAvailableLanguage('uk'), isTrue);
      expect(LanguageTools.isAvailableLanguage('ru'), isFalse);
      expect(LanguageTools.normalizeLanguage('pl'), LanguageTools.defaultLanguage);
    });

    test('checkLocale dispatches to the locale or the default', () {
      final functions = {'en': () => 'english', 'uk': () => 'ukrainian'};

      expect(LanguageTools.checkLocale('uk', languageFunctions: functions), 'ukrainian');
      expect(LanguageTools.checkLocale('fr', languageFunctions: functions), 'english');
    });
  });

  group('GetUserUseCase', () {
    test('maps the DTO and asks the repository for the current locale', () async {
      config.setCurrentLocale = 'uk';
      final useCase = GetUserUseCaseImpl(config, userRepository, PortfolioUserMapper(PortfolioSkillsMapper()));

      final user = await useCase.execute().first;

      expect(user.firstName, 'Dmitro');
      expect(user.secondName, 'Serdun');
      expect(user.position, '');
      expect(userRepository.requestedLocales, ['uk']);
    });
  });

  group('GetUserSkillsUseCase', () {
    test('maps every skill', () async {
      final useCase = GetUserUseCaseSkillsImpl(config, userRepository, PortfolioSkillsMapper());

      final skills = await useCase.execute().first;

      expect(skills.map((s) => s.title), ['Flutter']);
      expect(userRepository.requestedLocales, ['en']);
    });
  });

  group('GetContactsUseCase', () {
    test('maps every contact', () async {
      final useCase = GetContactsUseCaseImpl(config, userRepository, ContactMapper());

      final contacts = await useCase.execute().first;

      expect(contacts.single.title, 'Email');
      expect(contacts.single.value, 'me@example.com');
    });
  });

  group('GetProjectsUseCase', () {
    test('maps the list through the mapper', () async {
      final useCase = GetProjectsUseCaseImpl(config, projectRepository, ProjectMapper());

      final projects = await useCase.execute().first;

      expect(projects.map((p) => p.name), ['First', 'Second']);
      expect(projects.first.description, 'padded');
      expect(projectRepository.requestedLocales, ['en']);
    });
  });

  group('GetProjectByIdUseCase', () {
    test('passes the id and the current locale to the repository', () async {
      config.setCurrentLocale = 'uk';
      final useCase = GetProjectByIdUseCaseImpl(config, projectRepository, ProjectMapper());

      final project = await useCase.execute(id: '1').first;

      expect(project.name, 'Second');
      expect(projectRepository.requestedIds, ['1']);
      expect(projectRepository.requestedLocales, ['uk']);
    });

    test('propagates a repository error', () {
      final useCase = GetProjectByIdUseCaseImpl(config, projectRepository, ProjectMapper());

      expect(useCase.execute(id: 'missing').first, throwsStateError);
    });
  });

  group('GetUsefulCommandsUseCase', () {
    test('maps command groups', () async {
      final useCase = GetUsefulCommandsUseCaseImpl(config, usefulRepository, UsefulCommandsMapper());

      final groups = await useCase.execute().first;

      expect(groups.single.title, 'Git');
      expect(groups.single.commands.single.command, 'git status');
      expect(usefulRepository.requestedLocales, ['en']);
    });
  });
}
