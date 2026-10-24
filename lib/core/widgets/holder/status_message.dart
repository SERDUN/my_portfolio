import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/style/style.dart';

/// Centered icon, message and optional action: the one layout for errors,
/// empty states and the 404 page.
class StatusMessage extends StatelessWidget {
  const StatusMessage({super.key, required this.icon, required this.message, this.title, this.action});

  final IconData icon;
  final String message;
  final String? title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Semantics(
      liveRegion: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 96, horizontal: 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 40, color: context.palette.muted),
                if (title != null) ...[
                  const SizedBox(height: 16),
                  Text(title!, textAlign: TextAlign.center, style: textTheme.displaySmall),
                ],
                const SizedBox(height: 16),
                Text(message, textAlign: TextAlign.center, style: textTheme.titleMedium),
                if (action != null) ...[const SizedBox(height: 24), action!],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
