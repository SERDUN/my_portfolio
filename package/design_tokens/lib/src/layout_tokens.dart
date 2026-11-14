/// Sizes that are not colour or type.
abstract final class LayoutTokens {
  /// The widest the page content gets.
  static const double contentMaxWidth = 1200;

  /// Corner radius of cards.
  static const double radiusCard = 24;

  /// Corner radius of tiles inside cards.
  static const double radiusTile = 18;

  /// A radius large enough to make any control a stadium (pills, buttons).
  static const double radiusPill = 999;
}

/// One width range of the layout, inclusive at both ends.
class Breakpoint {
  const Breakpoint(this.name, this.start, this.end);

  final String name;
  final double start;

  /// [double.infinity] for the last range.
  final double end;
}

/// The layout ranges. "Wide" layouts (the inline navigation, the two-column
/// footer) start above [tablet].
abstract final class Breakpoints {
  static const mobile = Breakpoint('MOBILE', 0, 450);
  static const tablet = Breakpoint('TABLET', 451, 800);
  static const desktop = Breakpoint('DESKTOP', 801, 1920);
  static const fourK = Breakpoint('4K', 1921, double.infinity);

  static const List<Breakpoint> all = [mobile, tablet, desktop, fourK];
}
