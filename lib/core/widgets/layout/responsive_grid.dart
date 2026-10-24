import 'package:material_ui/material_ui.dart';

import 'package:responsive_framework/responsive_framework.dart';

/// Equal-width columns with equal-height rows. Cards in one row stretch to
/// the tallest, which a plain Wrap or GridView cannot do with free-height
/// content. Columns fall back from [desktop] to [tablet] to [mobile].
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.desktop = 3,
    this.tablet = 2,
    this.mobile = 1,
    this.gap = 20,
  });

  final List<Widget> children;
  final int desktop;
  final int tablet;
  final int mobile;
  final double gap;

  static int columnsOf(BuildContext context, {int desktop = 3, int tablet = 2, int mobile = 1}) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    if (breakpoints.isMobile) return mobile;
    if (breakpoints.isTablet) return tablet;
    return desktop;
  }

  @override
  Widget build(BuildContext context) {
    final columns = columnsOf(context, desktop: desktop, tablet: tablet, mobile: mobile);
    final rows = <Widget>[];
    for (var start = 0; start < children.length; start += columns) {
      final slice = children.sublist(start, (start + columns).clamp(0, children.length));
      final cells = <Widget>[];
      for (var i = 0; i < columns; i++) {
        if (i > 0) cells.add(SizedBox(width: gap));
        cells.add(Expanded(child: i < slice.length ? slice[i] : const SizedBox.shrink()));
      }
      if (rows.isNotEmpty) rows.add(SizedBox(height: gap));
      rows.add(IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: cells),
      ));
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: rows);
  }
}
