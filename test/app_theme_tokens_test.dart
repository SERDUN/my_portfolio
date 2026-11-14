import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/style/style.dart';

/// The theme reads its values from package/design_tokens. These are the values
/// it had when they were literals here, so moving them changed nothing a
/// visitor sees; a deliberate change to a token updates this table too.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('palette', () {
    test('light', () {
      final p = AppPalette.light;
      expect(
        [p.ground, p.card, p.line, p.ink, p.body, p.muted, p.accent, p.onAccent, p.accentSoft, p.chip],
        const [
          Color(0xFFF7F3EE),
          Color(0xFFFFFDFB),
          Color(0xFFE3DAD1),
          Color(0xFF1C1613),
          Color(0xFF3E3430),
          Color(0xFF6B5F58),
          Color(0xFF5A3E36),
          Color(0xFFF7F3EE),
          Color(0xFFEADFD6),
          Color(0xFFEFE6DE),
        ],
      );
      expect(
        [p.footer, p.footerLine, p.footerText, p.footerMuted, p.footerAccent],
        const [Color(0xFF1C1613), Color(0xFF4A3C36), Color(0xFFF7F3EE), Color(0xFFC9BDB2), Color(0xFFC9A896)],
      );
    });

    test('dark', () {
      final p = AppPalette.dark;
      expect(
        [p.ground, p.card, p.line, p.ink, p.body, p.muted, p.accent, p.onAccent, p.accentSoft, p.chip],
        const [
          Color(0xFF15110F),
          Color(0xFF1E1816),
          Color(0xFF342B27),
          Color(0xFFF3ECE6),
          Color(0xFFD8CEC6),
          Color(0xFFB3A69D),
          Color(0xFFD9B8A6),
          Color(0xFF1C1613),
          Color(0xFF3A2B26),
          Color(0xFF2A221F),
        ],
      );
      expect(
        [p.footer, p.footerLine, p.footerText, p.footerMuted, p.footerAccent],
        const [Color(0xFF0E0B0A), Color(0xFF342B27), Color(0xFFF3ECE6), Color(0xFFB3A69D), Color(0xFFC9A896)],
      );
    });
  });

  test('colour scheme slots outside the palette', () {
    final light = AppTheme.light().colorScheme;
    final dark = AppTheme.dark().colorScheme;
    expect(
      [light.error, light.onError, light.outline, light.shadow, light.scrim],
      const [Color(0xFFB3261E), Colors.white, Color(0xFFC9BDB2), Color(0xFF1C1613), Color(0xFF1C1613)],
    );
    expect(
      [dark.error, dark.onError, dark.outline, dark.shadow, dark.scrim],
      const [Color(0xFFF2B8B5), Color(0xFF601410), Color(0xFF4A3F3A), Color(0xFF1C1613), Color(0xFF1C1613)],
    );
  });

  test('layout sizes', () {
    expect([AppTheme.contentMaxWidth, AppTheme.radiusCard, AppTheme.radiusTile], [1200, 24, 18]);
  });

  test('type scale: family, size, line height, weight, tracking and colour', () {
    final p = AppPalette.light;
    final t = AppTheme.light().textTheme;
    // (style, family prefix, size, height, weight, letterSpacing, colour)
    final expected = <(TextStyle?, String, double, double, FontWeight, double?, Color)>[
      (t.displayLarge, 'Fraunces', 72, 1.04, FontWeight.w400, -1.44, p.ink),
      (t.displayMedium, 'Fraunces', 56, 1.04, FontWeight.w400, -1.12, p.ink),
      (t.displaySmall, 'Fraunces', 44, 1.1, FontWeight.w400, -0.88, p.ink),
      (t.headlineLarge, 'Fraunces', 36, 1.1, FontWeight.w400, -0.72, p.ink),
      (t.headlineMedium, 'Fraunces', 30, 1.1, FontWeight.w500, -0.6, p.ink),
      (t.headlineSmall, 'Fraunces', 26, 1.15, FontWeight.w500, -0.52, p.ink),
      (t.titleLarge, 'Fraunces', 24, 1.2, FontWeight.w500, -0.48, p.ink),
      (t.titleMedium, 'Manrope', 17, 1.5, FontWeight.w600, null, p.ink),
      (t.titleSmall, 'Manrope', 15, 1.5, FontWeight.w600, null, p.ink),
      (t.bodyLarge, 'Manrope', 19, 1.55, FontWeight.w400, null, p.body),
      (t.bodyMedium, 'Manrope', 17, 1.55, FontWeight.w400, null, p.body),
      (t.bodySmall, 'Manrope', 15, 1.5, FontWeight.w400, null, p.muted),
      (t.labelLarge, 'Manrope', 15, 1.2, FontWeight.w600, null, p.ink),
      (t.labelMedium, 'Manrope', 14, 1.2, FontWeight.w600, null, p.ink),
      (t.labelSmall, 'Manrope', 13, 1.2, FontWeight.w700, null, p.muted),
    ];
    for (final (style, family, size, height, weight, spacing, color) in expected) {
      expect(style!.fontFamily, startsWith(family));
      expect(style.fontSize, size);
      expect(style.height, height);
      expect(style.fontWeight, weight);
      if (spacing == null) {
        expect(style.letterSpacing, isNull, reason: '$family $size has no tracking');
      } else {
        expect(style.letterSpacing, closeTo(spacing, 1e-9));
      }
      expect(style.color, color);
    }
    expect(t.displayLarge!.fontFamilyFallback!.first, startsWith('PlayfairDisplay'));
  });
}
