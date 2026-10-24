import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/style/style.dart';

/// Two-pill segmented control: EN | UK. The selected pill is ink on paper.
class LanguageToggle extends StatelessWidget {
  const LanguageToggle({
    super.key,
    required this.current,
    required this.onChanged,
    this.locales = const [Locale('en'), Locale('uk')],
    this.semanticLabel,
  }) : compact = false;

  final Locale current;
  final ValueChanged<Locale> onChanged;
  final List<Locale> locales;
  final String? semanticLabel;

  /// One round button showing the current code; a tap moves to the next
  /// locale. For narrow headers where two pills do not fit.
  final bool compact;

  const LanguageToggle.compact({
    super.key,
    required this.current,
    required this.onChanged,
    this.locales = const [Locale('en'), Locale('uk')],
    this.semanticLabel,
  }) : compact = true;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    if (compact) {
      final index = locales.indexWhere((l) => l.languageCode == current.languageCode);
      final next = locales[(index + 1) % locales.length];
      return Semantics(
        button: true,
        label: semanticLabel,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Material(
            color: palette.card,
            shape: CircleBorder(side: BorderSide(color: palette.line)),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => onChanged(next),
              child: Center(
                child: Text(
                  current.languageCode.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: palette.ink, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Semantics(
      container: true,
      label: semanticLabel,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: palette.card,
          border: Border.all(color: palette.line),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final locale in locales) _pill(context, locale, locale.languageCode == current.languageCode),
          ],
        ),
      ),
    );
  }

  Widget _pill(BuildContext context, Locale locale, bool selected) {
    final palette = context.palette;
    final label = locale.languageCode.toUpperCase();
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: selected ? null : () => onChanged(locale),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 32,
          constraints: const BoxConstraints(minWidth: 44),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: selected ? palette.ink : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: selected ? palette.ground : palette.muted,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
