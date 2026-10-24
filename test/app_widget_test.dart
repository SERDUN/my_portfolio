import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/app/app.dart';
import 'package:data/data.dart';
import 'package:my_portfolio/di/injection.dart';
import 'package:my_portfolio/features/features.dart';

/// Pumps the real [Application] on the real container: router, theme,
/// localization delegates and the home page backed by the bundled assets.
void main() {
  setUpAll(() {
    // No network in tests: fall back to the default font instead of fetching.
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('renders the first frames and the home page without exceptions', (tester) async {
    final di = await configureDependencies(DataEnvironment.assets);

    await tester.pumpWidget(Application(di: di));
    expect(tester.takeException(), isNull);

    // Let the asset futures complete and the cubit emit.
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(tester.takeException(), isNull);
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(SiteHeader), findsOneWidget);
    expect(find.byType(SiteFooter), findsOneWidget);
    expect(find.text('Dmitro Serdun'), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
    // The bundled English intro reached the UI through the bio cubit.
    expect(find.textContaining('introduce myself'), findsOneWidget);
  });
}
