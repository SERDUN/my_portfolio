import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/app/app_routes.dart';
import 'package:my_portfolio/app/keys.dart';
import 'package:my_portfolio/core/core.dart';

import '../helpers/fake_app.dart';
import '../helpers/semantics.dart';

void main() {
  testSemanticsWidgets('a failed first load offers a named, identified retry', (tester) async {
    var retried = 0;
    await tester.pumpWidget(
      testHost(
        LoadStatusView(
          status: LoadStatus.failure,
          hasData: false,
          onRetry: () => retried++,
          builder: (_) => const Text('x'),
        ),
      ),
    );

    expectIdentifiedTapTargets(tester, [statusRetryId]);
    await tapViaSemantics(tester, findSemanticsId(statusRetryId));
    expect(retried, 1);
  });

  testSemanticsWidgets('a failed refresh keeps the page and offers the banner retry', (tester) async {
    var retried = 0;
    await tester.pumpWidget(
      testHost(
        SingleChildScrollView(
          child: LoadStatusView(
            status: LoadStatus.failure,
            hasData: true,
            onRetry: () => retried++,
            builder: (_) => const Text('x'),
          ),
        ),
      ),
    );

    expectIdentifiedTapTargets(tester, [statusBannerRetryId]);
    await tapViaSemantics(tester, findSemanticsId(statusBannerRetryId));
    expect(retried, 1);
  });

  testSemanticsWidgets('an unknown address shows the not-found screen with a way home', (tester) async {
    final router = await pumpFakeApp(tester, path: '/no-such-page');

    await expectAccessibleScreen(tester, notFoundScreenId);
    expectIdentifiedTapTargets(tester, [notFoundHomeId]);
    await tapViaSemantics(tester, findSemanticsId(notFoundHomeId));
    await settle(tester);
    expect(router.state.uri.path, AppRoutes.home.path);
  });
}
