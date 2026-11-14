import 'package:material_ui/material_ui.dart';

import 'package:design_tokens/design_tokens.dart';

/// The palette colours that have no slot in [ColorScheme]: the footer band,
/// the chip fill and the hairline. Read them with `context.palette`. The values
/// come from package/design_tokens, which the Jaspr stylesheet reads too.
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.ground,
    required this.card,
    required this.line,
    required this.ink,
    required this.body,
    required this.muted,
    required this.accent,
    required this.onAccent,
    required this.accentSoft,
    required this.chip,
    required this.footer,
    required this.footerLine,
    required this.footerText,
    required this.footerMuted,
    required this.footerAccent,
  });

  /// Page background.
  final Color ground;

  /// Card and raised surface background.
  final Color card;

  /// Hairlines and card borders.
  final Color line;

  /// Headings and primary text.
  final Color ink;

  /// Paragraph text.
  final Color body;

  /// Secondary text: eyebrows, captions, counts.
  final Color muted;

  /// The one accent: espresso.
  final Color accent;
  final Color onAccent;

  /// Soft accent fill behind images.
  final Color accentSoft;

  /// Chip fill.
  final Color chip;

  /// Footer band.
  final Color footer;
  final Color footerLine;
  final Color footerText;
  final Color footerMuted;
  final Color footerAccent;

  /// The palette of one brightness, from the shared design tokens.
  factory AppPalette.fromTokens(ColorTokens t) => AppPalette(
    ground: Color(t.ground),
    card: Color(t.card),
    line: Color(t.line),
    ink: Color(t.ink),
    body: Color(t.body),
    muted: Color(t.muted),
    accent: Color(t.accent),
    onAccent: Color(t.onAccent),
    accentSoft: Color(t.accentSoft),
    chip: Color(t.chip),
    footer: Color(t.footer),
    footerLine: Color(t.footerLine),
    footerText: Color(t.footerText),
    footerMuted: Color(t.footerMuted),
    footerAccent: Color(t.footerAccent),
  );

  static final light = AppPalette.fromTokens(ColorTokens.light);

  static final dark = AppPalette.fromTokens(ColorTokens.dark);

  @override
  AppPalette copyWith({
    Color? ground,
    Color? card,
    Color? line,
    Color? ink,
    Color? body,
    Color? muted,
    Color? accent,
    Color? onAccent,
    Color? accentSoft,
    Color? chip,
    Color? footer,
    Color? footerLine,
    Color? footerText,
    Color? footerMuted,
    Color? footerAccent,
  }) {
    return AppPalette(
      ground: ground ?? this.ground,
      card: card ?? this.card,
      line: line ?? this.line,
      ink: ink ?? this.ink,
      body: body ?? this.body,
      muted: muted ?? this.muted,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      accentSoft: accentSoft ?? this.accentSoft,
      chip: chip ?? this.chip,
      footer: footer ?? this.footer,
      footerLine: footerLine ?? this.footerLine,
      footerText: footerText ?? this.footerText,
      footerMuted: footerMuted ?? this.footerMuted,
      footerAccent: footerAccent ?? this.footerAccent,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    Color mix(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppPalette(
      ground: mix(ground, other.ground),
      card: mix(card, other.card),
      line: mix(line, other.line),
      ink: mix(ink, other.ink),
      body: mix(body, other.body),
      muted: mix(muted, other.muted),
      accent: mix(accent, other.accent),
      onAccent: mix(onAccent, other.onAccent),
      accentSoft: mix(accentSoft, other.accentSoft),
      chip: mix(chip, other.chip),
      footer: mix(footer, other.footer),
      footerLine: mix(footerLine, other.footerLine),
      footerText: mix(footerText, other.footerText),
      footerMuted: mix(footerMuted, other.footerMuted),
      footerAccent: mix(footerAccent, other.footerAccent),
    );
  }
}

extension AppPaletteX on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>() ?? AppPalette.light;
}
