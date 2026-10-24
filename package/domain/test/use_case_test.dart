import 'package:test/test.dart';

import 'package:domain/domain.dart';

/// In-memory repositories that record the localization they were asked for
/// and serve canned models; no data package, no assets.
class FakeUserRepository implements UserRepository {
  final List<Language> requestedLanguages = [];

  PortfolioUserModel user = PortfolioUserModel(firstName: 'Dmitro', secondName: 'Serdun', position: '', intro: '');
  List<SkillGroupModel> skills = [SkillGroupModel(title: 'Flutter')];
  List<ContactModel> contacts = [ContactModel(title: 'Email', value: 'me@example.com')];

  @override
  Stream<PortfolioUserModel> getUser(Language language) {
    requestedLanguages.add(language);
    return Stream.value(user);
  }

  @override
  Stream<List<SkillGroupModel>> getSkills(Language language) {
    requestedLanguages.add(language);
    return Stream.value(skills);
  }

  @override
  Stream<List<ContactModel>> getContacts(Language language) {
    requestedLanguages.add(language);
    return Stream.value(contacts);
  }
}

class FakeProjectRepository implements ProjectRepository {
  final List<Language> requestedLanguages = [];
  final List<String> requestedIds = [];

  List<ProjectModel> projects = [ProjectModel(id: '0', name: 'First'), ProjectModel(id: '1', name: 'Second')];

  @override
  Stream<List<ProjectModel>> getProjects(Language language) {
    requestedLanguages.add(language);
    return Stream.value(projects);
  }

  @override
  Stream<ProjectModel> getProjectById(String id, Language language) {
    requestedLanguages.add(language);
    requestedIds.add(id);
    final match = projects.where((p) => p.id == id);
    if (match.isEmpty) return Stream.error(ProjectNotFoundException(id));
    return Stream.value(match.first);
  }
}

class FakeUsefulRepository implements UsefulRepository {
  final List<Language> requestedLanguages = [];

  @override
  Stream<List<CommandGroupModel>> getUsefulCommands(Language language) {
    requestedLanguages.add(language);
    return Stream.value([
      CommandGroupModel('Git', [CommandModel('Status', 'git status')]),
    ]);
  }
}

void main() {
  late FakeUserRepository userRepository;
  late FakeProjectRepository projectRepository;
  late FakeUsefulRepository usefulRepository;

  setUp(() {
    userRepository = FakeUserRepository();
    projectRepository = FakeProjectRepository();
    usefulRepository = FakeUsefulRepository();
  });

  group('Language.fromCode', () {
    test('resolves codes with region and case variants', () {
      expect(Language.fromCode('uk'), Language.uk);
      expect(Language.fromCode('uk-UA'), Language.uk);
      expect(Language.fromCode('UK_ua'), Language.uk);
      expect(Language.fromCode('en'), Language.en);
    });

    test('falls back to English for anything unknown', () {
      expect(Language.fromCode('ua'), Language.fallback);
      expect(Language.fromCode('de'), Language.fallback);
      expect(Language.fromCode(''), Language.fallback);
      expect(Language.fromCode(null), Language.fallback);
    });
  });

  group('GetUserUseCase', () {
    test('asks the repository for the given language', () async {
      final useCase = GetUserUseCaseImpl(userRepository);

      final user = await useCase.execute(language: Language.uk).first;

      expect(user.name, 'Dmitro Serdun');
      expect(userRepository.requestedLanguages, [Language.uk]);
    });
  });

  group('GetUserSkillsUseCase', () {
    test('passes the language through unchanged', () async {
      final useCase = GetUserSkillsUseCaseImpl(userRepository);

      final skills = await useCase.execute(language: Language.en).first;

      expect(skills.map((s) => s.title), ['Flutter']);
      expect(userRepository.requestedLanguages, [Language.en]);
    });
  });

  group('GetContactsUseCase', () {
    test('returns every contact', () async {
      final useCase = GetContactsUseCaseImpl(userRepository);

      final contacts = await useCase.execute(language: Language.en).first;

      expect(contacts.single.title, 'Email');
      expect(contacts.single.value, 'me@example.com');
    });
  });

  group('GetProjectsUseCase', () {
    test('returns the list in order', () async {
      final useCase = GetProjectsUseCaseImpl(projectRepository);

      final projects = await useCase.execute(language: Language.en).first;

      expect(projects.map((p) => p.name), ['First', 'Second']);
      expect(projectRepository.requestedLanguages, [Language.en]);
    });
  });

  group('GetProjectByIdUseCase', () {
    test('passes the id and the language to the repository', () async {
      final useCase = GetProjectByIdUseCaseImpl(projectRepository);

      final project = await useCase.execute(id: '1', language: Language.uk).first;

      expect(project.name, 'Second');
      expect(projectRepository.requestedIds, ['1']);
      expect(projectRepository.requestedLanguages, [Language.uk]);
    });

    test('propagates a repository error', () {
      final useCase = GetProjectByIdUseCaseImpl(projectRepository);

      expect(useCase.execute(id: 'missing', language: Language.en).first, throwsA(isA<ProjectNotFoundException>()));
    });
  });

  group('GetUsefulCommandsUseCase', () {
    test('returns command groups', () async {
      final useCase = GetUsefulCommandsUseCaseImpl(usefulRepository);

      final groups = await useCase.execute(language: Language.en).first;

      expect(groups.single.title, 'Git');
      expect(groups.single.commands.single.command, 'git status');
      expect(usefulRepository.requestedLanguages, [Language.en]);
    });
  });

  group('ContactModel', () {
    test('an address is opened through mailto, a URL as is', () {
      final email = ContactModel(title: 'Email', value: 'me@example.com');
      final github = ContactModel(title: 'GitHub', value: 'https://github.com/me');

      expect(email.isEmail, isTrue);
      expect(email.link, 'mailto:me@example.com');
      expect(github.isEmail, isFalse);
      expect(github.link, 'https://github.com/me');
    });

    test('a handle is not an email and a mailto value is not prefixed twice', () {
      final handle = ContactModel(title: 'Telegram', value: '@ISerdun');
      final prefixed = ContactModel(title: 'Email', value: 'mailto:me@example.com');

      expect(handle.isEmail, isFalse);
      expect(handle.link, '@ISerdun');
      expect(prefixed.isEmail, isTrue);
      expect(prefixed.link, 'mailto:me@example.com');
      expect(prefixed.displayValue, 'me@example.com');
    });
  });

  group('ProjectModel', () {
    test('stack drops the platform name and summary falls back to the description', () {
      final project = ProjectModel(
        id: '1',
        name: 'App',
        description: 'Long text',
        platform: ProjectPlatform.flutter,
        technologies: const ['Flutter', 'BLoC', 'flutter'],
      );

      expect(project.stack, ['BLoC']);
      expect(project.summary, 'Long text');
    });

    test('links know whether there is a store to show', () {
      expect(const ProjectLinks().isEmpty, isTrue);
      expect(ProjectLinks(github: Uri.parse('https://github.com/x')).hasStore, isFalse);
      expect(ProjectLinks(appStore: Uri.parse('https://apps.apple.com/x')).hasStore, isTrue);
    });
  });
}
