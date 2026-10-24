import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/app.dart';
import 'package:my_portfolio/app/settings/settings.dart';
import 'package:my_portfolio/features/features.dart';
import 'package:my_portfolio/style/style.dart';

class _User implements GetUserUseCase {
  @override
  Stream<PortfolioUserModel> execute({required Language language}) => Stream.value(
    PortfolioUserModel(
      firstName: 'Test',
      secondName: 'Owner',
      position: 'Tester',
      intro: 'Fake intro from a fake use case',
    ),
  );
}

class _Skills implements GetUserSkillsUseCase {
  @override
  Stream<List<SkillGroupModel>> execute({required Language language}) => Stream.value(const []);
}

class _Contacts implements GetContactsUseCase {
  @override
  Stream<List<ContactModel>> execute({required Language language}) =>
      Stream.value([ContactModel(title: 'Email', value: 'fake@example.com')]);
}

class _Projects implements GetProjectsUseCase {
  @override
  Stream<List<ProjectModel>> execute({required Language language}) =>
      Stream.value([ProjectModel(id: '1', name: 'Fake project')]);
}

class _ProjectById implements GetProjectByIdUseCase {
  @override
  Stream<ProjectModel> execute({required String id, required Language language}) =>
      Stream.error(ProjectNotFoundException(id));
}

class _Useful implements GetUsefulCommandsUseCase {
  @override
  Stream<List<CommandGroupModel>> execute({required Language language}) => Stream.value([
    CommandGroupModel('Git', [CommandModel('Status', 'git status')]),
  ]);
}

/// Pumps the shipping [AppView] with fake use cases: no container involved.
/// Every route is visited, so a page that reads a use case nobody provides
/// fails here instead of on first navigation.
void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('every route builds from the widget tree', (tester) async {
    tester.view.physicalSize = const Size(1280, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final settings = AppSettingsCubit();
    final router = buildAppRouter();
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
          getUsefulCommands: _Useful(),
        ),
        settings: settings,
        router: router,
      ),
    );

    Future<void> visit(String path) async {
      router.go(path);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      expect(tester.takeException(), isNull, reason: path);
    }

    await visit(AppRoutes.home.path);
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.textContaining('Fake intro'), findsOneWidget);

    await visit(AppRoutes.projects.path);
    expect(find.byType(ProjectsPage), findsOneWidget);
    expect(find.text('Fake project'), findsWidgets);

    await visit('${AppRoutes.projects.path}/missing');
    expect(find.byType(ProjectPage), findsOneWidget);
    expect(find.text('There is no such project.'), findsOneWidget);

    await visit(AppRoutes.contacts.path);
    expect(find.byType(ContactsPage), findsOneWidget);

    await visit(AppRoutes.useful.path);
    expect(find.byType(UsefulCommandsPage), findsOneWidget);
    expect(find.text('git status'), findsOneWidget);
  });
}
