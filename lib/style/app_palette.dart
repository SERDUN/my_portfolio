import 'package:material_ui/material_ui.dart';

/// Design tokens that have no slot in [ColorScheme]: the footer band, the
/// chip fill and the hairline. Read them with `context.palette`.
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

  static const light = AppPalette(
    ground: Color(0xFFF7F3EE),
    card: Color(0xFFFFFDFB),
    line: Color(0xFFE3DAD1),
    ink: Color(0xFF1C1613),
    body: Color(0xFF3E3430),
    muted: Color(0xFF6B5F58),
    accent: Color(0xFF5A3E36),
    onAccent: Color(0xFFF7F3EE),
    accentSoft: Color(0xFFEADFD6),
    chip: Color(0xFFEFE6DE),
    footer: Color(0xFF1C1613),
    footerLine: Color(0xFF4A3C36),
    footerText: Color(0xFFF7F3EE),
    footerMuted: Color(0xFFC9BDB2),
    footerAccent: Color(0xFFC9A896),
  );

  static const dark = AppPalette(
    ground: Color(0xFF15110F),
    card: Color(0xFF1E1816),
    line: Color(0xFF342B27),
    ink: Color(0xFFF3ECE6),
    body: Color(0xFFD8CEC6),
    muted: Color(0xFFB3A69D),
    accent: Color(0xFFD9B8A6),
    onAccent: Color(0xFF1C1613),
    accentSoft: Color(0xFF3A2B26),
    chip: Color(0xFF2A221F),
    footer: Color(0xFF0E0B0A),
    footerLine: Color(0xFF342B27),
    footerText: Color(0xFFF3ECE6),
    footerMuted: Color(0xFFB3A69D),
    footerAccent: Color(0xFFC9A896),
  );

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
