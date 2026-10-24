import 'package:flutter_test/flutter_test.dart';

import 'package:my_portfolio/app/app_routes.dart';
import 'package:my_portfolio/app/keys.dart';

import '../helpers/fake_app.dart';
import '../helpers/semantics.dart';

void main() {
  testSemanticsWidgets('project: back, store links and next project are named and identified', (tester) async {
    final router = await pumpFakeApp(tester, path: '${AppRoutes.projects.path}/1');

    await expectAccessibleScreen(tester, projectScreenId);
    expectIdentifiedTapTargets(tester, [
      projectBackId,
      projectAppStoreId,
      projectGooglePlayId,
      projectGithubId,
      projectNextId,
    ]);
    expect(tester.getSemantics(findSemanticsId(projectNextId)), isSemantics(label: 'Next project: Beta', isLink: true));

    await tapViaSemantics(tester, findSemanticsId(projectNextId));
    await settle(tester);
    expect(router.state.uri.path, '${AppRoutes.projects.path}/2');

    await tapViaSemantics(tester, findSemanticsId(projectBackId));
    await settle(tester);
    expect(router.state.uri.path, AppRoutes.projects.path);
  });

  testSemanticsWidgets('project not found: the way back is named and identified', (tester) async {
    final router = await pumpFakeApp(tester, path: '${AppRoutes.projects.path}/missing');

    await expectAccessibleScreen(tester, projectScreenId);
    expectIdentifiedTapTargets(tester, [projectNotFoundBackId]);
    await tapViaSemantics(tester, findSemanticsId(projectNotFoundBackId));
    await settle(tester);
    expect(router.state.uri.path, AppRoutes.projects.path);
  });
}
