import 'package:material_ui/material_ui.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'package:my_portfolio/style/style.dart';

/// Centers its child in a column of at most [maxWidth] with the page gutter:
/// 40 px on desktop and tablet, 20 px on phones.
class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child, this.maxWidth = AppTheme.contentMaxWidth, this.padding});

  final Widget child;
  final double maxWidth;

  /// Vertical padding; the horizontal gutter is added on top of it.
  final EdgeInsets? padding;

  static double gutterOf(BuildContext context) => ResponsiveBreakpoints.of(context).isMobile ? 20 : 40;

  @override
  Widget build(BuildContext context) {
    final gutter = gutterOf(context);
    final vertical = padding ?? EdgeInsets.zero;
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(padding: EdgeInsets.fromLTRB(gutter, vertical.top, gutter, vertical.bottom), child: child),
      ),
    );
  }
}
