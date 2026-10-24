import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';
import 'package:my_portfolio/app/app_frame.dart';

/// Finds the semantics node that carries [identifier].
Finder findSemanticsId(String identifier) => find.byWidgetPredicate(
  (w) => w is Semantics && w.properties.identifier == identifier,
  description: 'id $identifier',
);

/// Asserts the control is exposed as ONE node carrying the tap action
/// together with [label] and/or [identifier]. Both are optional, so an
/// omitted one is not checked. [tooltip] defaults to empty because a stray
/// tooltip merged in from a nested widget is spoken on top of the label.
/// Call within a `tester.ensureSemantics()` scope.
void expectTapTargetSemantics(
  WidgetTester tester,
  Finder finder, {
  String? label,
  String? identifier,
  bool? isButton,
  bool? isLink,
  String? tooltip = '',
}) {
  expect(
    tester.getSemantics(finder),
    isSemantics(
      label: label,
      identifier: identifier,
      tooltip: tooltip,
      hasTapAction: true,
      isButton: isButton,
      isLink: isLink,
    ),
  );
}

/// Activates the control the way assistive technology does: through the tap
/// action of its semantics node. A pointer tap can pass while the semantics
/// path is broken, so activation tests use this instead of `tester.tap`.
Future<void> tapViaSemantics(WidgetTester tester, Finder finder) async {
  final node = tester.getSemantics(finder);
  expect(node.getSemanticsData().hasAction(SemanticsAction.tap), isTrue, reason: 'no tap action: $node');
  node.owner!.performAction(node.id, SemanticsAction.tap);
  await tester.pump();
}

/// A MaterialApp with the app's theme, localizations and frame around
/// [child], for testing one widget or page without the router.
Widget testHost(Widget child, {Locale locale = const Locale('en')}) => MaterialApp(
  theme: AppTheme.light(),
  locale: locale,
  builder: appFrameBuilder,
  localizationsDelegates: const [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
  supportedLocales: supportedLocales,
  home: Scaffold(body: child),
);

/// Asserts every id in [ids] is on screen exactly once, as a tap target
/// with a non-empty name. Icon buttons are named by their tooltip; list
/// those in [namedByTooltip].
void expectIdentifiedTapTargets(WidgetTester tester, Iterable<String> ids, {Set<String> namedByTooltip = const {}}) {
  for (final id in ids) {
    final finder = findSemanticsId(id);
    expect(finder, findsOneWidget, reason: 'id $id');
    final data = tester.getSemantics(finder).getSemanticsData();
    expect(data.identifier, id);
    expect(data.hasAction(SemanticsAction.tap), isTrue, reason: '$id has no tap action');
    if (namedByTooltip.contains(id)) {
      expect(data.tooltip, isNotEmpty, reason: '$id has no tooltip');
    } else {
      expect(data.label, isNotEmpty, reason: '$id has no name');
      expect(data.tooltip, isEmpty, reason: '$id speaks a stray tooltip');
    }
  }
}

/// Asserts the screen anchor [screenId] is present and that every tap
/// target on screen has a name (Flutter's labeledTapTargetGuideline).
Future<void> expectAccessibleScreen(WidgetTester tester, String screenId) async {
  expect(findSemanticsId(screenId), findsOneWidget, reason: 'screen $screenId');
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
}

/// A widget test with the semantics tree on. The handle is released in
/// `finally`: a failing expectation would otherwise leave it open and add a
/// second, misleading failure. (A tear-down runs too late for this check.)
void testSemanticsWidgets(String description, WidgetTesterCallback body) {
  testWidgets(description, (tester) async {
    final handle = tester.ensureSemantics();
    try {
      await body(tester);
    } finally {
      handle.dispose();
    }
  });
}
