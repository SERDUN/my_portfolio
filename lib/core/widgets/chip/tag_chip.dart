import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/style/style.dart';

enum TagChipStyle {
  /// Soft fill: skills and the project stack.
  filled,

  /// Hairline only: technology tags on cards.
  outlined,
}

/// Rounded label for a skill or a technology.
class TagChip extends StatelessWidget {
  const TagChip(this.label, {super.key, this.style = TagChipStyle.filled, this.small = false});

  final String label;
  final TagChipStyle style;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final outlined = style == TagChipStyle.outlined;
    return Container(
      padding: small
          ? const EdgeInsets.symmetric(horizontal: 10, vertical: 5)
          : const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : palette.chip,
        border: outlined ? Border.all(color: palette.line) : null,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: (small ? Theme.of(context).textTheme.labelSmall : Theme.of(context).textTheme.labelMedium)?.copyWith(
          color: palette.body,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
