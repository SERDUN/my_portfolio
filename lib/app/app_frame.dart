import 'package:material_ui/material_ui.dart';

import 'package:responsive_framework/responsive_framework.dart';

const List<Breakpoint> appBreakpoints = [
  Breakpoint(start: 0, end: 450, name: MOBILE),
  Breakpoint(start: 451, end: 800, name: TABLET),
  Breakpoint(start: 801, end: 1920, name: DESKTOP),
  Breakpoint(start: 1921, end: double.infinity, name: '4K'),
];

/// `MaterialApp.builder` of the app: breakpoints for the layouts, mouse drag
/// scrolling, and the compatibility bridge. Shared with widget tests so they
/// render pages inside the same frame.
Widget appFrameBuilder(BuildContext context, Widget? child) {
  // Bridges ThemeData and MaterialLocalizations to packages that still import
  // package:flutter/material.dart (responsive_framework, octo_image,
  // flutter_blurhash). Deprecated by design: drop it once they move to
  // material_ui.
  // ignore: deprecated_member_use
  return MaterialUiCompatibilityBridge(
    child: ResponsiveBreakpoints.builder(
      child: BouncingScrollWrapper.builder(context, child!, dragWithMouse: true),
      breakpoints: appBreakpoints,
    ),
  );
}
