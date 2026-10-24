import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/style/style.dart';

import '../../extensions/project_platform_x.dart';

/// Small uppercase tag naming the platform of a project. Flutter is set in
/// the accent, Android in ink, so the two read apart at a glance.
class PlatformTag extends StatelessWidget {
  const PlatformTag(this.platform, {super.key});

  final ProjectPlatform platform;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isFlutter = platform == ProjectPlatform.flutter;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isFlutter ? palette.accent : palette.body,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        platform.label.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isFlutter ? palette.onAccent : palette.ground,
          fontSize: 12,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
