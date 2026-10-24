import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/app.dart';
import 'package:my_portfolio/app/settings/settings.dart';

/// Content every screen test renders: one of each kind of data, with ids
/// and titles that are easy to assert on.
final fakeOwner = PortfolioUserModel(
  firstName: 'Test',
  secondName: 'Owner',
  position: 'Tester',
  location: 'Odesa',
  headline: 'Apps on every screen.',
  headlineAccent: 'every screen',
  intro: 'A fake intro.',
  cv: Uri.parse('https://cv.example/cv.pdf'),
  experienceSince: 2019,
);

final fakeSkills = [
  SkillGroupModel(title: 'Flutter', skills: const [SkillModel('Dart'), SkillModel('BLoC')]),
];

final fakeContacts = [
  ContactModel(title: 'Email', value: 'me@example.com'),
  ContactModel(title: 'GitHub', value: 'https://github.com/example'),
];

final fakeProjects = [
  ProjectModel(
    id: '1',
    name: 'Alpha',
    intro: 'First app',
    description: 'The first project.',
    platform: ProjectPlatform.flutter,
    technologies: const ['Flutter', 'BLoC'],
    featured: true,
    links: ProjectLinks(
      googlePlay: Uri.parse('https://play.example/a'),
      appStore: Uri.parse('https://apps.example/a'),
      github: Uri.parse('https://github.com/example/a'),
    ),
  ),
  ProjectModel(
    id: '2',
    name: 'Beta',
    intro: 'Second app',
    platform: ProjectPlatform.android,
    technologies: const ['Android'],
  ),
];

final fakeCommands = [
  CommandGroupModel('Git', [CommandModel('Status', 'git status')]),
];

class _User implements GetUserUseCase {
  @override
  Stream<PortfolioUserModel> execute({required Language language}) => Stream.value(fakeOwner);
}

class _Skills implements GetUserSkillsUseCase {
  @override
  Stream<List<SkillGroupModel>> execute({required Language language}) => Stream.value(fakeSkills);
}

class _Contacts implements GetContactsUseCase {
  @override
  Stream<List<ContactModel>> execute({required Language language}) => Stream.value(fakeContacts);
}

class _Projects implements GetProjectsUseCase {
  @override
  Stream<List<ProjectModel>> execute({required Language language}) => Stream.value(fakeProjects);
}

class _ProjectById implements GetProjectByIdUseCase {
  @override
  Stream<ProjectModel> execute({required String id, required Language language}) {
    final match = fakeProjects.where((p) => p.id == id);
    return match.isEmpty ? Stream.error(ProjectNotFoundException(id)) : Stream.value(match.first);
  }
}

class _Commands implements GetUsefulCommandsUseCase {
  @override
  Stream<List<CommandGroupModel>> execute({required Language language}) => Stream.value(fakeCommands);
}

/// Pumps the shipping [AppView] with the fake content at [path], at a
/// desktop or phone width, and returns its router. The content has no
/// image URLs: network images cannot load in tests.
Future<GoRouter> pumpFakeApp(WidgetTester tester, {String path = '/', bool phone = false}) async {
  tester.view.physicalSize = phone ? const Size(390, 2400) : const Size(1280, 3200);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final settings = AppSettingsCubit();
  final router = buildAppRouter(initialLocation: path);
  addTearDown(settings.close);
  addTearDown(router.dispose);

  await tester.pumpWidget(
    AppView(
      useCases: AppUseCases(
        getUser: _User(),
        getUserSkills: _Skills(),
        getContacts: _Contacts(),
        getProjects: _Projects(),
        getProjectById: _ProjectById(),
        getUsefulCommands: _Commands(),
      ),
      settings: settings,
      router: router,
    ),
  );
  await settle(tester);
  return router;
}

/// Lets streams deliver and transitions finish. The fake content has no
/// network images, so nothing keeps scheduling frames forever.
Future<void> settle(WidgetTester tester) => tester.pumpAndSettle();
