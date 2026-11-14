import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

import 'package:design_tokens/design_tokens.dart';

import 'app_palette.dart';

/// "Editorial espresso": warm paper ground, ink text, one espresso accent.
/// Fraunces for display and headings, Manrope for everything else.
class AppTheme {
  const AppTheme._();

  static const double contentMaxWidth = LayoutTokens.contentMaxWidth;
  static const double radiusCard = LayoutTokens.radiusCard;
  static const double radiusTile = LayoutTokens.radiusTile;

  /// Fraunces has no Cyrillic. Ukrainian headings fall through to Playfair
  /// Display; both styles are requested so the italic file is loaded too.
  static List<String> get displayFallback => [
    GoogleFonts.getFont(FontTokens.displayFallback).fontFamily!,
    GoogleFonts.getFont(FontTokens.displayFallback, fontStyle: FontStyle.italic).fontFamily!,
  ];

  static ThemeData light() => _build(Brightness.light, AppPalette.light, ColorTokens.light);

  static ThemeData dark() => _build(Brightness.dark, AppPalette.dark, ColorTokens.dark);

  static ThemeData _build(Brightness brightness, AppPalette p, ColorTokens t) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: p.accent,
      onPrimary: p.onAccent,
      primaryContainer: p.accentSoft,
      onPrimaryContainer: p.ink,
      secondary: p.body,
      onSecondary: p.ground,
      secondaryContainer: p.chip,
      onSecondaryContainer: p.body,
      tertiary: p.footerAccent,
      onTertiary: p.footer,
      error: Color(t.error),
      onError: Color(t.onError),
      surface: p.ground,
      onSurface: p.ink,
      surfaceContainerLowest: p.card,
      surfaceContainerLow: p.card,
      surfaceContainer: p.card,
      surfaceContainerHigh: p.chip,
      surfaceContainerHighest: p.chip,
      onSurfaceVariant: p.muted,
      outline: Color(t.outline),
      outlineVariant: p.line,
      inverseSurface: p.footer,
      onInverseSurface: p.footerText,
      inversePrimary: p.footerAccent,
      shadow: Color(t.shadow),
      scrim: Color(t.shadow),
    );

    final text = _textTheme(p);
    final stadium = RoundedRectangleBorder(borderRadius: BorderRadius.circular(LayoutTokens.radiusPill));

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: p.ground,
      canvasColor: p.ground,
      textTheme: text,
      extensions: [p],
      splashFactory: InkSparkle.splashFactory,
      visualDensity: VisualDensity.standard,
      appBarTheme: AppBarTheme(
        backgroundColor: p.ground,
        foregroundColor: p.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: text.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: p.card,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusCard),
          side: BorderSide(color: p.line),
        ),
      ),
      dividerTheme: DividerThemeData(color: p.line, thickness: 1, space: 1),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: p.accent,
          foregroundColor: p.onAccent,
          minimumSize: const Size(44, 48),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          shape: stadium,
          textStyle: text.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: p.ink,
          minimumSize: const Size(44, 48),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          side: BorderSide(color: scheme.outline),
          shape: stadium,
          textStyle: text.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: p.accent,
          minimumSize: const Size(44, 44),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          shape: stadium,
          textStyle: text.labelLarge,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: p.ink,
          backgroundColor: p.card,
          minimumSize: const Size(44, 44),
          side: BorderSide(color: p.line),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: p.chip,
        side: BorderSide.none,
        shape: stadium,
        labelStyle: text.labelMedium?.copyWith(color: p.body),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        iconColor: p.ink,
        collapsedIconColor: p.ink,
        shape: const Border(),
        collapsedShape: const Border(),
      ),
      listTileTheme: ListTileThemeData(iconColor: p.ink, textColor: p.ink),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: p.card,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(color: p.footer, borderRadius: BorderRadius.circular(8)),
        textStyle: text.labelMedium?.copyWith(color: p.footerText),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: p.accent),
      textSelectionTheme: TextSelectionThemeData(selectionColor: p.accentSoft, cursorColor: p.accent),
    );
  }

  static TextTheme _textTheme(AppPalette p) {
    final base = GoogleFonts.manropeTextTheme();
    TextStyle style(TextToken token) {
      final color = switch (token.color) {
        TextColorRole.ink => p.ink,
        TextColorRole.body => p.body,
        TextColorRole.muted => p.muted,
      };
      final weight = FontWeight.values[token.weight ~/ 100 - 1];
      return switch (token.font) {
        FontRole.display => GoogleFonts.getFont(
          FontTokens.display,
          fontSize: token.size,
          height: token.height,
          fontWeight: weight,
          letterSpacing: token.letterSpacing,
          color: color,
        ).copyWith(fontFamilyFallback: displayFallback),
        FontRole.sans => GoogleFonts.getFont(
          FontTokens.sans,
          fontSize: token.size,
          height: token.height,
          fontWeight: weight,
          color: color,
        ),
      };
    }

    return base.copyWith(
      displayLarge: style(TypeScale.displayLarge),
      displayMedium: style(TypeScale.displayMedium),
      displaySmall: style(TypeScale.displaySmall),
      headlineLarge: style(TypeScale.headlineLarge),
      headlineMedium: style(TypeScale.headlineMedium),
      headlineSmall: style(TypeScale.headlineSmall),
      titleLarge: style(TypeScale.titleLarge),
      titleMedium: style(TypeScale.titleMedium),
      titleSmall: style(TypeScale.titleSmall),
      bodyLarge: style(TypeScale.bodyLarge),
      bodyMedium: style(TypeScale.bodyMedium),
      bodySmall: style(TypeScale.bodySmall),
      labelLarge: style(TypeScale.labelLarge),
      labelMedium: style(TypeScale.labelMedium),
      labelSmall: style(TypeScale.labelSmall),
    );
  }
}
