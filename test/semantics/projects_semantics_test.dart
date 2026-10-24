import 'package:flutter_test/flutter_test.dart';

import 'package:my_portfolio/app/app_routes.dart';
import 'package:my_portfolio/app/keys.dart';

import '../helpers/fake_app.dart';
import '../helpers/semantics.dart';

void main() {
  testSemanticsWidgets('projects: filters and cards are named, identified and activatable', (tester) async {
    final router = await pumpFakeApp(tester, path: AppRoutes.projects.path);

    await expectAccessibleScreen(tester, projectsScreenId);
    expectIdentifiedTapTargets(tester, [
      projectsFilterAllId,
      projectsFilterId('flutter'),
      projectsFilterId('android'),
      projectsCardId('1'),
      projectsCardId('2'),
      projectsContactCtaId,
    ]);
    expect(
      tester.getSemantics(findSemanticsId(projectsFilterAllId)),
      isSemantics(isSelected: true, hasTapAction: true),
    );

    await tapViaSemantics(tester, findSemanticsId(projectsFilterId('android')));
    await settle(tester);
    expect(findSemanticsId(projectsCardId('1')), findsNothing);
    expect(tester.getSemantics(findSemanticsId(projectsFilterId('android'))), isSemantics(isSelected: true));

    await tapViaSemantics(tester, findSemanticsId(projectsCardId('2')));
    await settle(tester);
    expect(router.state.uri.path, '${AppRoutes.projects.path}/2');
  });
}
