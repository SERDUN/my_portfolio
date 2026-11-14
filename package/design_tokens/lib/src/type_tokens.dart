/// The font families. Fraunces has no Cyrillic, so Ukrainian headings fall
/// through to Playfair Display.
abstract final class FontTokens {
  /// Display and headings.
  static const String display = 'Fraunces';

  /// The fallback of [display] for scripts it lacks.
  static const String displayFallback = 'Playfair Display';

  /// Everything else.
  static const String sans = 'Manrope';
}

/// Which family a text role is set in.
enum FontRole { display, sans }

/// Which palette colour a text role is drawn in, by [ColorTokens] name.
enum TextColorRole { ink, body, muted }

/// One step of the type scale.
class TextToken {
  const TextToken({
    required this.font,
    required this.size,
    required this.height,
    required this.weight,
    this.color = TextColorRole.ink,
    this.tracking = 0,
  });

  final FontRole font;

  /// Logical pixels.
  final double size;

  /// Line height as a multiple of [size].
  final double height;

  /// 100 to 900.
  final int weight;

  final TextColorRole color;

  /// Letter spacing of a sans step, in logical pixels. The Flutter theme does
  /// not set it: `Theme.of` fills it from Material 3's English-like type
  /// geometry, and these are those values (a Flutter test holds them equal).
  /// Controls that take their text style from a button theme get none.
  final double tracking;

  /// Display type is set slightly tight: -0.02 of the size; sans uses
  /// [tracking].
  double get letterSpacing => font == FontRole.display ? -0.02 * size : tracking;
}

/// The type scale, named after the Material text theme roles the Flutter app
/// maps it onto.
abstract final class TypeScale {
  static const displayLarge = TextToken(font: FontRole.display, size: 72, height: 1.04, weight: 400);
  static const displayMedium = TextToken(font: FontRole.display, size: 56, height: 1.04, weight: 400);
  static const displaySmall = TextToken(font: FontRole.display, size: 44, height: 1.1, weight: 400);
  static const headlineLarge = TextToken(font: FontRole.display, size: 36, height: 1.1, weight: 400);
  static const headlineMedium = TextToken(font: FontRole.display, size: 30, height: 1.1, weight: 500);
  static const headlineSmall = TextToken(font: FontRole.display, size: 26, height: 1.15, weight: 500);
  static const titleLarge = TextToken(font: FontRole.display, size: 24, height: 1.2, weight: 500);
  static const titleMedium = TextToken(font: FontRole.sans, size: 17, height: 1.5, weight: 600, tracking: 0.15);
  static const titleSmall = TextToken(font: FontRole.sans, size: 15, height: 1.5, weight: 600, tracking: 0.1);
  static const bodyLarge = TextToken(
    font: FontRole.sans,
    size: 19,
    height: 1.55,
    weight: 400,
    color: TextColorRole.body,
    tracking: 0.5,
  );
  static const bodyMedium = TextToken(
    font: FontRole.sans,
    size: 17,
    height: 1.55,
    weight: 400,
    color: TextColorRole.body,
    tracking: 0.25,
  );
  static const bodySmall = TextToken(
    font: FontRole.sans,
    size: 15,
    height: 1.5,
    weight: 400,
    color: TextColorRole.muted,
    tracking: 0.4,
  );
  static const labelLarge = TextToken(font: FontRole.sans, size: 15, height: 1.2, weight: 600, tracking: 0.1);
  static const labelMedium = TextToken(font: FontRole.sans, size: 14, height: 1.2, weight: 600, tracking: 0.5);
  static const labelSmall = TextToken(
    font: FontRole.sans,
    size: 13,
    height: 1.2,
    weight: 700,
    color: TextColorRole.muted,
    tracking: 0.5,
  );

  /// Every step by its role name, largest first.
  static const Map<String, TextToken> byName = {
    'display-large': displayLarge,
    'display-medium': displayMedium,
    'display-small': displaySmall,
    'headline-large': headlineLarge,
    'headline-medium': headlineMedium,
    'headline-small': headlineSmall,
    'title-large': titleLarge,
    'title-medium': titleMedium,
    'title-small': titleSmall,
    'body-large': bodyLarge,
    'body-medium': bodyMedium,
    'body-small': bodySmall,
    'label-large': labelLarge,
    'label-medium': labelMedium,
    'label-small': labelSmall,
  };
}
