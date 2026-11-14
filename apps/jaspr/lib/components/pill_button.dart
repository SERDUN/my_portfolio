import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'icons.dart';

/// The looks of Flutter's `PillButton`.
enum PillVariant {
  /// Espresso fill: the primary action of a section.
  filled,

  /// Ink fill: the header call to action.
  ink,

  /// Hairline border: the secondary action.
  outline,

  /// No chrome, accent text: inline "see all" links.
  ghost,
}

/// A stadium-shaped link that looks like Flutter's `PillButton`: 48 px tall
/// (44 when [compact]), the icon after the label. Every action on this static
/// site goes somewhere, so it is an `<a>`; without an [href] it renders
/// disabled, as Flutter does without `onPressed`.
Component pillButton({
  required String label,
  required String? href,
  AppIcon? icon,
  PillVariant variant = PillVariant.filled,
  bool compact = false,
  bool external = false,
  bool download = false,
  String? classes,
}) {
  final classList = [
    'pill',
    'pill--${variant.name}',
    if (compact) 'pill--compact',
    if (href == null) 'pill--disabled',
    't-label-large',
    ?classes,
  ].join(' ');
  final children = [
    span([.text(label)]),
    if (icon != null) appIcon(icon, size: 18),
  ];
  if (href == null) return span(classes: classList, attributes: const {'aria-disabled': 'true'}, children);
  return a(
    href: href,
    classes: classList,
    target: external ? Target.blank : null,
    attributes: {if (external) 'rel': 'noopener', if (download) 'download': ''},
    children,
  );
}
