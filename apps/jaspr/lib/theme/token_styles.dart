import 'package:design_tokens/design_tokens.dart';

/// The shared design tokens as CSS: the palette as custom properties per
/// theme, and one class per step of the type scale. web/styles.css only reads
/// `var(--...)` and these classes, so no colour or type size is written twice.
///
/// Themes: light by default; dark when the system asks for it and the visitor
/// has not chosen light, or when the visitor chose dark (`data-theme` on
/// `<html>`, set by web/theme.js).
///
/// Type classes are mobile first, as the Flutter screens switch styles at the
/// layout breakpoints: `t-<role>` applies everywhere, `t-tablet-<role>` from
/// the tablet range up, `t-wide-<role>` above the tablet range.
String tokenStylesheet() {
  final out = StringBuffer();

  String vars(ColorTokens colors) =>
      [for (final MapEntry(key: name, value: argb) in colors.byName.entries) '--$name: ${cssColor(argb)};'].join(' ');

  out
    ..writeln(':root { ${vars(ColorTokens.light)} color-scheme: light; ${_fontVars()} ${_layoutVars()} }')
    ..writeln('@media (prefers-color-scheme: dark) {')
    ..writeln('  :root:not([data-theme="light"]) { ${vars(ColorTokens.dark)} color-scheme: dark; }')
    ..writeln('}')
    ..writeln(':root[data-theme="dark"] { ${vars(ColorTokens.dark)} color-scheme: dark; }');

  for (final MapEntry(key: name, value: token) in TypeScale.byName.entries) {
    out.writeln('.t-$name { ${_type(token)} }');
  }
  out.writeln('@media (min-width: ${Breakpoints.tablet.start.toInt()}px) {');
  for (final MapEntry(key: name, value: token) in TypeScale.byName.entries) {
    out.writeln('  .t-tablet-$name { ${_type(token)} }');
  }
  out
    ..writeln('}')
    ..writeln('@media (min-width: ${Breakpoints.desktop.start.toInt()}px) {');
  for (final MapEntry(key: name, value: token) in TypeScale.byName.entries) {
    out.writeln('  .t-wide-$name { ${_type(token)} }');
  }
  out.writeln('}');
  return out.toString();
}

String _fontVars() =>
    "--font-display: '${FontTokens.display}', '${FontTokens.displayFallback}', Georgia, serif; "
    "--font-sans: '${FontTokens.sans}', system-ui, sans-serif;";

String _layoutVars() =>
    '--content-max-width: ${_px(LayoutTokens.contentMaxWidth)}; --radius-card: ${_px(LayoutTokens.radiusCard)}; '
    '--radius-tile: ${_px(LayoutTokens.radiusTile)}; --radius-pill: ${_px(LayoutTokens.radiusPill)};';

String _type(TextToken token) {
  final family = token.font == FontRole.display ? 'var(--font-display)' : 'var(--font-sans)';
  final spacing = token.letterSpacing == 0 ? 'normal' : _px(token.letterSpacing);
  return 'font-family: $family; font-size: ${_px(token.size)}; line-height: ${token.height}; '
      'font-weight: ${token.weight}; letter-spacing: $spacing; color: var(--${token.color.name});';
}

String _px(double value) {
  final rounded = double.parse(value.toStringAsFixed(4));
  return '${rounded == rounded.roundToDouble() ? rounded.toInt() : rounded}px';
}
