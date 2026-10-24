import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/style/style.dart';

import '../semantics/semantic_action.dart';

enum PillButtonVariant {
  /// Espresso fill: the primary action of a section.
  filled,

  /// Ink fill: the header call to action.
  ink,

  /// Hairline border: the secondary action.
  outline,

  /// No chrome, accent text with an arrow: inline "see all" links.
  ghost,
}

/// Stadium-shaped button used everywhere in the redesign. 48 px tall, with an
/// optional icon after the label.
class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = PillButtonVariant.filled,
    this.compact = false,
    this.iconLeading = false,
    this.identifier,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final PillButtonVariant variant;

  /// 44 px tall with tighter padding, for toolbars.
  final bool compact;

  /// Puts the icon before the label (a back arrow).
  final bool iconLeading;

  /// Automation id from `lib/app/keys.dart`; the label is the visible text.
  final String? identifier;

  @override
  Widget build(BuildContext context) => SemanticAction(identifier: identifier, child: _button(context));

  Widget _button(BuildContext context) {
    final palette = context.palette;
    final padding = compact
        ? const EdgeInsets.symmetric(horizontal: 18, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 22, vertical: 14);
    final minimumSize = Size(44, compact ? 44 : 48);

    final iconWidget = icon == null ? null : Icon(icon, size: 18);
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (iconWidget != null && iconLeading) ...[iconWidget, const SizedBox(width: 10)],
        Text(label),
        if (iconWidget != null && !iconLeading) ...[const SizedBox(width: 10), iconWidget],
      ],
    );

    switch (variant) {
      case PillButtonVariant.filled:
        return FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(padding: padding, minimumSize: minimumSize),
          child: child,
        );
      case PillButtonVariant.ink:
        return FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: palette.ink,
            foregroundColor: palette.ground,
            padding: padding,
            minimumSize: minimumSize,
          ),
          child: child,
        );
      case PillButtonVariant.outline:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(padding: padding, minimumSize: minimumSize),
          child: child,
        );
      case PillButtonVariant.ghost:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: palette.accent,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            minimumSize: minimumSize,
          ),
          child: child,
        );
    }
  }
}
