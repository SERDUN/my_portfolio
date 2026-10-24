import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

import 'app_palette.dart';

/// "Editorial espresso": warm paper ground, ink text, one espresso accent.
/// Fraunces for display and headings, Manrope for everything else.
class AppTheme {
  const AppTheme._();

  static const double contentMaxWidth = 1200;
  static const double radiusCard = 24;
  static const double radiusTile = 18;

  static ThemeData light() => _build(Brightness.light, AppPalette.light);

  static ThemeData dark() => _build(Brightness.dark, AppPalette.dark);

  static ThemeData _build(Brightness brightness, AppPalette p) {
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
      error: brightness == Brightness.light ? const Color(0xFFB3261E) : const Color(0xFFF2B8B5),
      onError: brightness == Brightness.light ? Colors.white : const Color(0xFF601410),
      surface: p.ground,
      onSurface: p.ink,
      surfaceContainerLowest: p.card,
      surfaceContainerLow: p.card,
      surfaceContainer: p.card,
      surfaceContainerHigh: p.chip,
      surfaceContainerHighest: p.chip,
      onSurfaceVariant: p.muted,
      outline: brightness == Brightness.light ? const Color(0xFFC9BDB2) : const Color(0xFF4A3F3A),
      outlineVariant: p.line,
      inverseSurface: p.footer,
      onInverseSurface: p.footerText,
      inversePrimary: p.footerAccent,
      shadow: const Color(0xFF1C1613),
      scrim: const Color(0xFF1C1613),
    );

    final text = _textTheme(p);
    final stadium = RoundedRectangleBorder(borderRadius: BorderRadius.circular(999));

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
    TextStyle display(double size, {double height = 1.04, FontWeight weight = FontWeight.w400}) =>
        GoogleFonts.fraunces(fontSize: size, height: height, fontWeight: weight, letterSpacing: -0.02 * size, color: p.ink);
    TextStyle sans(double size, {double height = 1.5, FontWeight weight = FontWeight.w400, Color? color}) =>
        GoogleFonts.manrope(fontSize: size, height: height, fontWeight: weight, color: color ?? p.ink);

    return base.copyWith(
      displayLarge: display(72),
      displayMedium: display(56),
      displaySmall: display(44, height: 1.1),
      headlineLarge: display(36, height: 1.1),
      headlineMedium: display(30, height: 1.1, weight: FontWeight.w500),
      headlineSmall: display(26, height: 1.15, weight: FontWeight.w500),
      titleLarge: display(24, height: 1.2, weight: FontWeight.w500),
      titleMedium: sans(17, weight: FontWeight.w600),
      titleSmall: sans(15, weight: FontWeight.w600),
      bodyLarge: sans(19, height: 1.55, color: p.body),
      bodyMedium: sans(17, height: 1.55, color: p.body),
      bodySmall: sans(15, height: 1.5, color: p.muted),
      labelLarge: sans(15, height: 1.2, weight: FontWeight.w600),
      labelMedium: sans(14, height: 1.2, weight: FontWeight.w600),
      labelSmall: sans(13, height: 1.2, weight: FontWeight.w700, color: p.muted),
    );
  }
}
