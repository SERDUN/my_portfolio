import 'package:flutter_test/flutter_test.dart';

import 'package:my_portfolio/app/app_routes.dart';
import 'package:my_portfolio/app/keys.dart';

import '../helpers/fake_app.dart';
import '../helpers/semantics.dart';

void main() {
  testSemanticsWidgets('home: every control is named, identified and activatable', (tester) async {
    final router = await pumpFakeApp(tester);

    await expectAccessibleScreen(tester, homeScreenId);
    expectIdentifiedTapTargets(tester, [
      homeDownloadCvId,
      homeSeeProjectsId,
      homeAllProjectsId,
      homeProjectCardId('1'),
    ]);

    await tapViaSemantics(tester, findSemanticsId(homeProjectCardId('1')));
    await settle(tester);
    expect(router.state.uri.path, '${AppRoutes.projects.path}/1');

    router.go(AppRoutes.home.path);
    await settle(tester);
    await tapViaSemantics(tester, findSemanticsId(homeSeeProjectsId));
    await settle(tester);
    expect(router.state.uri.path, AppRoutes.projects.path);
  });
}
