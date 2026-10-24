import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/style/style.dart';

/// Small-caps section label in the accent color ("SKILLS", "SELECTED WORK").
class Eyebrow extends StatelessWidget {
  const Eyebrow(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: Theme.of(
        context,
      ).textTheme.labelSmall?.copyWith(color: color ?? context.palette.accent, letterSpacing: 1.8),
    );
  }
}
