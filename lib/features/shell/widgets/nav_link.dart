import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/style/style.dart';

/// Header navigation item: muted text, the current page in ink with an
/// accent underline.
class NavLink extends StatelessWidget {
  const NavLink({super.key, required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    return Semantics(
      link: true,
      selected: selected,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        hoverColor: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(minHeight: 44),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: selected ? palette.accent : Colors.transparent, width: 2)),
          ),
          child: Text(
            label,
            style: textTheme.titleSmall?.copyWith(
              color: selected ? palette.ink : palette.muted,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
