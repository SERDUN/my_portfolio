import 'package:material_ui/material_ui.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'package:design_tokens/design_tokens.dart' as tokens;

/// The layout ranges from the shared design tokens, so the Jaspr site's media
/// queries break at the same widths.
final List<Breakpoint> appBreakpoints = [
  for (final b in tokens.Breakpoints.all) Breakpoint(start: b.start, end: b.end, name: b.name),
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
