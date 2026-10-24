import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/style/style.dart';

/// Two-pill segmented control: EN | UK, or one round button in [compact]
/// mode. Speaks [Language] directly so no locale conversion can pick a
/// language that does not exist.
class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key, required this.current, required this.onChanged, this.semanticLabel})
    : compact = false;

  /// One round button showing the current code; a tap moves to the next
  /// language. For narrow headers where two pills do not fit.
  const LanguageToggle.compact({super.key, required this.current, required this.onChanged, this.semanticLabel})
    : compact = true;

  final Language current;
  final ValueChanged<Language> onChanged;
  final String? semanticLabel;
  final bool compact;

  static const List<Language> _languages = Language.values;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    if (compact) {
      final next = _languages[(_languages.indexOf(current) + 1) % _languages.length];
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
                  current.code.toUpperCase(),
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: palette.ink, fontWeight: FontWeight.w700),
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
            for (final language in _languages)
              _LanguagePill(language: language, selected: language == current, onTap: () => onChanged(language)),
          ],
        ),
      ),
    );
  }
}

class _LanguagePill extends StatelessWidget {
  const _LanguagePill({required this.language, required this.selected, required this.onTap});

  final Language language;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final label = language.code.toUpperCase();
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: selected ? null : onTap,
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
