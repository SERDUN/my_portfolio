import 'package:flutter_test/flutter_test.dart';

import 'package:my_portfolio/app/app_routes.dart';
import 'package:my_portfolio/app/keys.dart';

import '../helpers/fake_app.dart';
import '../helpers/semantics.dart';

void main() {
  testSemanticsWidgets('desktop header and footer: every control is named and identified', (tester) async {
    final router = await pumpFakeApp(tester);

    expectIdentifiedTapTargets(
      tester,
      [
        shellWordmarkId,
        shellNavHomeId,
        shellNavProjectsId,
        shellNavContactsId,
        shellLanguageOptionId('en'),
        shellLanguageOptionId('uk'),
        shellThemeButtonId,
        shellCvButtonId,
        shellFooterEmailId,
        shellFooterSocialId('GitHub'),
        shellFooterProjectsId,
        shellFooterUsefulId,
        shellFooterSourceId,
      ],
      namedByTooltip: {shellThemeButtonId},
    );
    expect(
      tester.getSemantics(findSemanticsId(shellLanguageOptionId('en'))),
      isSemantics(label: 'EN, English', isSelected: true),
    );

    await tapViaSemantics(tester, findSemanticsId(shellNavContactsId));
    await settle(tester);
    expect(router.state.uri.path, AppRoutes.contacts.path);

    await tapViaSemantics(tester, findSemanticsId(shellLanguageOptionId('uk')));
    await settle(tester);
    expect(
      tester.getSemantics(findSemanticsId(shellLanguageOptionId('uk'))),
      isSemantics(label: 'UK, Українська', isSelected: true),
    );

    await tapViaSemantics(tester, findSemanticsId(shellFooterUsefulId));
    await settle(tester);
    expect(router.state.uri.path, AppRoutes.useful.path);
  });

  testSemanticsWidgets('phone header and menu: every control is named and identified', (tester) async {
    final router = await pumpFakeApp(tester, phone: true);

    expectIdentifiedTapTargets(
      tester,
      [shellWordmarkId, shellLanguageCompactId, shellThemeButtonId, shellMenuButtonId],
      namedByTooltip: {shellThemeButtonId, shellMenuButtonId},
    );
    expect(
      tester.getSemantics(findSemanticsId(shellLanguageCompactId)),
      isSemantics(label: 'EN, switch language to Українська', isButton: true),
    );

    await tapViaSemantics(tester, findSemanticsId(shellMenuButtonId));
    await settle(tester);
    expectIdentifiedTapTargets(tester, [
      shellMenuItemId('home'),
      shellMenuItemId('projects'),
      shellMenuItemId('contacts'),
      shellMenuItemId('useful'),
      shellMenuCvButtonId,
    ]);
    expect(tester.getSemantics(findSemanticsId(shellMenuItemId('home'))), isSemantics(isSelected: true));

    await tapViaSemantics(tester, findSemanticsId(shellMenuItemId('projects')));
    await settle(tester);
    expect(router.state.uri.path, AppRoutes.projects.path);
  });
}
