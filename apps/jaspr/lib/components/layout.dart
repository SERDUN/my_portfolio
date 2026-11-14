import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// The page column: at most the content width, with the page gutter (40 px,
/// 20 px on phones) inside it. Flutter's `ContentWidth`. [classes] set the
/// vertical padding of the section it frames.
Component contentWidth(List<Component> children, {String? classes, String tag = 'div'}) => Component.element(
  tag: tag,
  classes: classes == null ? 'content-width' : 'content-width $classes',
  children: children,
);

/// Equal-width columns, three on desktop, two on tablets, one on phones, rows
/// as tall as their tallest card. Flutter's `ResponsiveGrid`.
Component responsiveGrid(List<Component> children) => div(classes: 'responsive-grid', children);

/// Small-caps section label in the accent colour. Flutter's `Eyebrow`.
Component eyebrow(String text, {String? classes}) =>
    span(classes: classes == null ? 'eyebrow t-label-small' : 'eyebrow t-label-small $classes', [.text(text)]);

/// Eyebrow and display title over a hairline, with a description or an action
/// beside it on wider screens. Flutter's `SectionHeader`.
Component sectionHeader({
  required String eyebrowText,
  required String title,
  String? description,
  Component? trailing,
}) {
  final side =
      trailing ??
      (description == null ? null : p(classes: 'section-header__description t-body-medium', [.text(description)]));
  return div(classes: 'section-header', [
    div(classes: 'section-header__heading', [
      eyebrow(eyebrowText),
      h2(classes: 'section-header__title t-headline-medium t-tablet-display-small', [.text(title)]),
    ]),
    ?side,
  ]);
}

/// [text] with its line breaks kept, as a Flutter `Text` keeps them: one text
/// node per line with a `<br>` between. (CSS `pre-line` would also keep the
/// whitespace the server's pretty-printed HTML puts around the text.)
List<Component> multiline(String text) {
  final lines = text.split('\n');
  return [
    for (final (index, line) in lines.indexed) ...[if (index > 0) br(), Component.text(line)],
  ];
}
