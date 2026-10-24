import 'package:flutter_test/flutter_test.dart';

import 'package:my_portfolio/app/app.dart';
import 'package:my_portfolio/features/features.dart';

import 'helpers/fake_app.dart';

/// Pumps the shipping [AppView] with fake use cases: no container involved.
/// Every route is visited, so a page that reads a use case nobody provides
/// fails here instead of on first navigation.
void main() {
  testWidgets('every route builds from the widget tree', (tester) async {
    final router = await pumpFakeApp(tester);

    Future<void> visit(String path) async {
      router.go(path);
      await settle(tester);
      expect(tester.takeException(), isNull, reason: path);
    }

    await visit(AppRoutes.home.path);
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.textContaining('A fake intro'), findsOneWidget);

    await visit(AppRoutes.projects.path);
    expect(find.byType(ProjectsPage), findsOneWidget);
    expect(find.text('Beta'), findsWidgets);

    await visit('${AppRoutes.projects.path}/missing');
    expect(find.byType(ProjectPage), findsOneWidget);
    expect(find.text('There is no such project.'), findsOneWidget);

    await visit(AppRoutes.contacts.path);
    expect(find.byType(ContactsPage), findsOneWidget);

    await visit(AppRoutes.useful.path);
    expect(find.byType(UsefulCommandsPage), findsOneWidget);
    expect(find.text('git status'), findsOneWidget);
  });

  testWidgets('heading back into the shell while it is still leaving for the not-found page', (tester) async {
    final router = await pumpFakeApp(tester);

    router.go('/no-such-page');
    await tester.pump(const Duration(milliseconds: 100));
    router.go(AppRoutes.home.path);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(tester.takeException(), isNull);
    expect(find.byType(HomePage), findsOneWidget);
  });
}
