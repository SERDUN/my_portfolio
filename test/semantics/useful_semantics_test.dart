import 'package:my_portfolio/app/app_routes.dart';
import 'package:my_portfolio/app/keys.dart';

import '../helpers/fake_app.dart';
import '../helpers/semantics.dart';

void main() {
  testSemanticsWidgets('useful: each copy button names its command', (tester) async {
    await pumpFakeApp(tester, path: AppRoutes.useful.path);

    await expectAccessibleScreen(tester, usefulScreenId);
    expectIdentifiedTapTargets(tester, [usefulCopyId('git status')]);
    expectTapTargetSemantics(
      tester,
      findSemanticsId(usefulCopyId('git status')),
      label: 'Copy: Status',
      isButton: true,
    );
  });
}
