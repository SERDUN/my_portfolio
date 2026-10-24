import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/style/style.dart';

/// Small uppercase tag naming the platform of a project. Flutter is set in
/// the accent, everything else in ink, so the two read apart at a glance.
class PlatformTag extends StatelessWidget {
  const PlatformTag(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isFlutter = label.toLowerCase() == 'flutter';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isFlutter ? palette.accent : palette.body,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isFlutter ? palette.onAccent : palette.ground,
          fontSize: 12,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
