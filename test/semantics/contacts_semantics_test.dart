import 'package:my_portfolio/app/app_routes.dart';
import 'package:my_portfolio/app/keys.dart';

import '../helpers/fake_app.dart';
import '../helpers/semantics.dart';

void main() {
  testSemanticsWidgets('contacts: each card names its channel and address once', (tester) async {
    await pumpFakeApp(tester, path: AppRoutes.contacts.path);

    await expectAccessibleScreen(tester, contactsScreenId);
    expectIdentifiedTapTargets(tester, [contactsCardId('Email'), contactsCardId('GitHub')]);
    expectTapTargetSemantics(
      tester,
      findSemanticsId(contactsCardId('Email')),
      label: 'Email: me@example.com',
      isLink: true,
    );
  });
}
