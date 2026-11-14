/// One colour as `0xAARRGGBB`, the form Flutter's `Color` takes.
typedef Argb = int;

/// The palette of one brightness. "Editorial espresso": warm paper ground, ink
/// text, one espresso accent.
class ColorTokens {
  const ColorTokens({
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
    required this.error,
    required this.onError,
    required this.outline,
    required this.shadow,
  });

  /// Page background.
  final Argb ground;

  /// Card and raised surface background.
  final Argb card;

  /// Hairlines and card borders.
  final Argb line;

  /// Headings and primary text.
  final Argb ink;

  /// Paragraph text.
  final Argb body;

  /// Secondary text: eyebrows, captions, counts.
  final Argb muted;

  /// The one accent: espresso.
  final Argb accent;
  final Argb onAccent;

  /// Soft accent fill behind images.
  final Argb accentSoft;

  /// Chip fill.
  final Argb chip;

  /// Footer band.
  final Argb footer;
  final Argb footerLine;
  final Argb footerText;
  final Argb footerMuted;
  final Argb footerAccent;

  /// Error text and its foreground on an error fill.
  final Argb error;
  final Argb onError;

  /// Outlined controls.
  final Argb outline;

  /// Shadows and scrims.
  final Argb shadow;

  static const light = ColorTokens(
    ground: 0xFFF7F3EE,
    card: 0xFFFFFDFB,
    line: 0xFFE3DAD1,
    ink: 0xFF1C1613,
    body: 0xFF3E3430,
    muted: 0xFF6B5F58,
    accent: 0xFF5A3E36,
    onAccent: 0xFFF7F3EE,
    accentSoft: 0xFFEADFD6,
    chip: 0xFFEFE6DE,
    footer: 0xFF1C1613,
    footerLine: 0xFF4A3C36,
    footerText: 0xFFF7F3EE,
    footerMuted: 0xFFC9BDB2,
    footerAccent: 0xFFC9A896,
    error: 0xFFB3261E,
    onError: 0xFFFFFFFF,
    outline: 0xFFC9BDB2,
    shadow: 0xFF1C1613,
  );

  static const dark = ColorTokens(
    ground: 0xFF15110F,
    card: 0xFF1E1816,
    line: 0xFF342B27,
    ink: 0xFFF3ECE6,
    body: 0xFFD8CEC6,
    muted: 0xFFB3A69D,
    accent: 0xFFD9B8A6,
    onAccent: 0xFF1C1613,
    accentSoft: 0xFF3A2B26,
    chip: 0xFF2A221F,
    footer: 0xFF0E0B0A,
    footerLine: 0xFF342B27,
    footerText: 0xFFF3ECE6,
    footerMuted: 0xFFB3A69D,
    footerAccent: 0xFFC9A896,
    error: 0xFFF2B8B5,
    onError: 0xFF601410,
    outline: 0xFF4A3F3A,
    shadow: 0xFF1C1613,
  );

  /// Every colour by its token name, in declaration order: what a stylesheet
  /// generator walks.
  Map<String, Argb> get byName => {
    'ground': ground,
    'card': card,
    'line': line,
    'ink': ink,
    'body': body,
    'muted': muted,
    'accent': accent,
    'on-accent': onAccent,
    'accent-soft': accentSoft,
    'chip': chip,
    'footer': footer,
    'footer-line': footerLine,
    'footer-text': footerText,
    'footer-muted': footerMuted,
    'footer-accent': footerAccent,
    'error': error,
    'on-error': onError,
    'outline': outline,
    'shadow': shadow,
  };
}

/// `#rrggbb` for an opaque colour, `rgba(r, g, b, a)` otherwise.
String cssColor(Argb argb) {
  final a = (argb >> 24) & 0xFF;
  final rgb = argb & 0xFFFFFF;
  if (a == 0xFF) return '#${rgb.toRadixString(16).padLeft(6, '0')}';
  final r = (argb >> 16) & 0xFF, g = (argb >> 8) & 0xFF, b = argb & 0xFF;
  return 'rgba($r, $g, $b, ${(a / 255).toStringAsFixed(3)})';
}
