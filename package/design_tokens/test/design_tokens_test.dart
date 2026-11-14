import 'package:test/test.dart';

import 'package:design_tokens/design_tokens.dart';

void main() {
  test('both palettes name the same tokens', () {
    expect(ColorTokens.dark.byName.keys, ColorTokens.light.byName.keys);
  });

  test('cssColor writes opaque colours as hex and others as rgba', () {
    expect(cssColor(0xFFF7F3EE), '#f7f3ee');
    expect(cssColor(0xFF000000), '#000000');
    expect(cssColor(0x801C1613), 'rgba(28, 22, 19, 0.502)');
  });

  test('display type is set tight, sans is not', () {
    expect(TypeScale.displayLarge.letterSpacing, closeTo(-1.44, 1e-9));
    expect(TypeScale.bodyMedium.letterSpacing, 0);
  });

  test('breakpoints cover every width without a gap', () {
    for (var i = 1; i < Breakpoints.all.length; i++) {
      expect(Breakpoints.all[i].start, Breakpoints.all[i - 1].end + 1);
    }
  });
}
