import 'package:material_ui/material_ui.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'package:my_portfolio/style/style.dart';

import 'eyebrow.dart';

/// Eyebrow + display title, with an optional description or action on the
/// right. Sits on a hairline so sections read as separate bands.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.description,
    this.trailing,
    this.divider = true,
  });

  final String eyebrow;
  final String title;
  final String? description;
  final Widget? trailing;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final heading = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Eyebrow(eyebrow),
        const SizedBox(height: 10),
        Text(title, style: isMobile ? textTheme.headlineMedium : textTheme.displaySmall),
      ],
    );

    Widget? side;
    if (trailing != null) {
      side = trailing;
    } else if (description != null) {
      side = ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Text(description!, style: textTheme.bodyMedium?.copyWith(color: context.palette.muted)),
      );
    }

    return Container(
      padding: EdgeInsets.only(top: divider ? 32 : 0),
      decoration: divider
          ? BoxDecoration(
              border: Border(top: BorderSide(color: context.palette.line)),
            )
          : null,
      child: isMobile || side == null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading,
                if (side != null) ...[const SizedBox(height: 16), side],
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: heading),
                const SizedBox(width: 24),
                side,
              ],
            ),
    );
  }
}
