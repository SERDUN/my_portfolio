import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../semantics/semantic_action.dart';

/// Two-pill segmented control: EN | UK, or one round button in [compact]
/// mode. Speaks [Language] directly so no locale conversion can pick a
/// language that does not exist. Accessible names start with the visible
/// code ("UK, Українська") so voice control can use what is on screen.
class LanguageToggle extends StatelessWidget {
  const LanguageToggle({
    super.key,
    required this.current,
    required this.onChanged,
    this.optionIdentifier,
    this.groupLabel,
  }) : compact = false,
       compactIdentifier = null;

  /// One round button showing the current code; a tap moves to the next
  /// language. For narrow headers where two pills do not fit.
  const LanguageToggle.compact({super.key, required this.current, required this.onChanged, this.compactIdentifier})
    : compact = true,
      optionIdentifier = null,
      groupLabel = null;

  final Language current;
  final ValueChanged<Language> onChanged;

  /// Automation id of each pill, from `lib/app/keys.dart`.
  final String Function(Language language)? optionIdentifier;

  /// Automation id of the compact button, from `lib/app/keys.dart`.
  final String? compactIdentifier;

  /// Name of the pill group as a whole.
  final String? groupLabel;
  final bool compact;

  static const List<Language> _languages = Language.values;

  Language get _next => _languages[(_languages.indexOf(current) + 1) % _languages.length];

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    if (compact) {
      final code = current.code.toUpperCase();
      return SemanticAction.button(
        label: context.l10n.common_semanticsLabel_languageCompact(code, _next.nativeName),
        identifier: compactIdentifier,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Material(
            color: palette.card,
            shape: CircleBorder(side: BorderSide(color: palette.line)),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => onChanged(_next),
              child: Center(
                child: ExcludeSemantics(
                  child: Text(
                    code,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(color: palette.ink, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Semantics(
      container: true,
      explicitChildNodes: true,
      label: groupLabel,
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
              _LanguagePill(
                language: language,
                selected: language == current,
                identifier: optionIdentifier?.call(language),
                onTap: () => onChanged(language),
              ),
          ],
        ),
      ),
    );
  }
}

class _LanguagePill extends StatelessWidget {
  const _LanguagePill({required this.language, required this.selected, required this.onTap, this.identifier});

  final Language language;
  final bool selected;
  final String? identifier;

  /// Kept on the selected pill too: choosing the current language is a
  /// no-op, and a button without a tap action would be unusable to
  /// assistive technology.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final code = language.code.toUpperCase();
    return SemanticAction.button(
      label: context.l10n.common_semanticsLabel_languageOption(code, language.nativeName),
      identifier: identifier,
      selected: selected,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
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
            child: ExcludeSemantics(
              child: Text(
                code,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: selected ? palette.ground : palette.muted,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
