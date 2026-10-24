import 'package:test/test.dart';

import 'package:domain/domain.dart';

/// In-memory repositories that record the localization they were asked for
/// and serve canned models; no data package, no assets.
class FakeUserRepository implements UserRepository {
  final List<String> requestedLocales = [];

  PortfolioUserModel user = PortfolioUserModel(
    firstName: 'Dmitro',
    secondName: 'Serdun',
    position: '',
    intro: '',
    avatar: '',
    cv: '',
  );
  List<PortfolioSkillsModel> skills = [PortfolioSkillsModel(title: 'Flutter', expanded: false, children: const [])];
  List<ContactsModel> contacts = [ContactsModel(title: 'Email', value: 'me@example.com')];

  @override
  Stream<PortfolioUserModel> getUser(String localization) {
    requestedLocales.add(localization);
    return Stream.value(user);
  }

  @override
  Stream<List<PortfolioSkillsModel>> getSkills(String localization) {
    requestedLocales.add(localization);
    return Stream.value(skills);
  }

  @override
  Stream<List<ContactsModel>> getContacts(String localization) {
    requestedLocales.add(localization);
    return Stream.value(contacts);
  }
}

class FakeProjectRepository implements ProjectRepository {
  final List<String> requestedLocales = [];
  final List<String> requestedIds = [];

  List<ProjectModel> projects = [
    ProjectModel(id: '0', name: 'First', linkAndroid: '', linkIOS: '', linkGithub: ''),
    ProjectModel(id: '1', name: 'Second', linkAndroid: '', linkIOS: '', linkGithub: ''),
  ];

  @override
  Stream<List<ProjectModel>> getProjects(String localization) {
    requestedLocales.add(localization);
    return Stream.value(projects);
  }

  @override
  Stream<ProjectModel> getProjectById(String id, String localization) {
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
  Stream<List<UsefulCommandsModel>> getUsefulCommands(String localization) {
    requestedLocales.add(localization);
    return Stream.value([
      UsefulCommandsModel('Git', [UsefulCommandModel('Status', 'git status')]),
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
    test('asks the repository for the current locale', () async {
      config.setCurrentLocale = 'uk';
      final useCase = GetUserUseCaseImpl(config, userRepository);

      final user = await useCase.execute().first;

      expect(user.name, 'Dmitro Serdun');
      expect(userRepository.requestedLocales, ['uk']);
    });
  });

  group('GetUserSkillsUseCase', () {
    test('returns the skills for the default locale', () async {
      final useCase = GetUserSkillsUseCaseImpl(config, userRepository);

      final skills = await useCase.execute().first;

      expect(skills.map((s) => s.title), ['Flutter']);
      expect(userRepository.requestedLocales, ['en']);
    });
  });

  group('GetContactsUseCase', () {
    test('returns every contact', () async {
      final useCase = GetContactsUseCaseImpl(config, userRepository);

      final contacts = await useCase.execute().first;

      expect(contacts.single.title, 'Email');
      expect(contacts.single.value, 'me@example.com');
    });
  });

  group('GetProjectsUseCase', () {
    test('returns the list in order', () async {
      final useCase = GetProjectsUseCaseImpl(config, projectRepository);

      final projects = await useCase.execute().first;

      expect(projects.map((p) => p.name), ['First', 'Second']);
      expect(projectRepository.requestedLocales, ['en']);
    });
  });

  group('GetProjectByIdUseCase', () {
    test('passes the id and the current locale to the repository', () async {
      config.setCurrentLocale = 'uk';
      final useCase = GetProjectByIdUseCaseImpl(config, projectRepository);

      final project = await useCase.execute(id: '1').first;

      expect(project.name, 'Second');
      expect(projectRepository.requestedIds, ['1']);
      expect(projectRepository.requestedLocales, ['uk']);
    });

    test('propagates a repository error', () {
      final useCase = GetProjectByIdUseCaseImpl(config, projectRepository);

      expect(useCase.execute(id: 'missing').first, throwsStateError);
    });
  });

  group('GetUsefulCommandsUseCase', () {
    test('returns command groups', () async {
      final useCase = GetUsefulCommandsUseCaseImpl(config, usefulRepository);

      final groups = await useCase.execute().first;

      expect(groups.single.title, 'Git');
      expect(groups.single.commands.single.command, 'git status');
      expect(usefulRepository.requestedLocales, ['en']);
    });
  });
}
