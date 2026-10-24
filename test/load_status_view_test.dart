import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

Widget _host(Widget child) => MaterialApp(
  theme: AppTheme.light(),
  localizationsDelegates: const [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
  supportedLocales: const [Locale('en')],
  home: Scaffold(body: SingleChildScrollView(child: child)),
);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  const content = Text('content');

  testWidgets('a pending first load shows a spinner', (tester) async {
    await tester.pumpWidget(_host(LoadStatusView(status: LoadStatus.loading, hasData: false, builder: (_) => content)));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('content'), findsNothing);
  });

  testWidgets('an empty success renders the page, never an endless spinner', (tester) async {
    await tester.pumpWidget(_host(LoadStatusView(status: LoadStatus.success, hasData: false, builder: (_) => content)));
    expect(find.text('content'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('a failed first load shows the error and calls retry', (tester) async {
    var retried = 0;
    await tester.pumpWidget(
      _host(
        LoadStatusView(status: LoadStatus.failure, hasData: false, onRetry: () => retried++, builder: (_) => content),
      ),
    );
    expect(find.text('Could not load this page.'), findsOneWidget);
    await tester.tap(find.text('Try again'));
    expect(retried, 1);
  });

  testWidgets('a failed reload keeps the loaded content under a banner', (tester) async {
    await tester.pumpWidget(
      _host(LoadStatusView(status: LoadStatus.failure, hasData: true, onRetry: () {}, builder: (_) => content)),
    );
    expect(find.text('content'), findsOneWidget);
    expect(find.text('Could not load this page.'), findsOneWidget);
  });
}
