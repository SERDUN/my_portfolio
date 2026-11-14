import 'package:domain/domain.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:presentation/presentation.dart';

import 'chips.dart';
import 'layout.dart';

/// The sizes Flutter's `PhoneFrame` is used at; web/styles.css holds each.
enum PhoneFrameSize {
  /// The vertical project card: 300 px well, 220 px phone.
  card,

  /// The horizontal project card: 200 px wide (104 on phones).
  cardHorizontal,

  /// The project page hero: 520 px well, 280 px phone (380 / 220 on phones).
  hero,
}

/// A phone screenshot rising out of a soft well: dark bezel, rounded top
/// corners, cut at the bottom of the well. Flutter's `PhoneFrame`.
Component phoneFrame({required Uri? image, required String alt, PhoneFrameSize size = PhoneFrameSize.card}) =>
    div(classes: 'phone-frame phone-frame--${size.name}', [
      div(classes: 'phone-frame__phone', [
        div(classes: 'phone-frame__screen', [
          if (image != null) img(src: image.toString(), alt: alt, loading: MediaLoading.lazy),
        ]),
      ]),
    ]);

/// A project as a card linking to its page: the screenshot, the name with the
/// platform tag, three lines of the summary and up to three technologies.
/// Flutter's `ProjectCard` in its vertical layout.
Component projectCard(ProjectModel project, {required String href, required String accessibleName}) => a(
  href: href,
  classes: 'project-card',
  attributes: {'aria-label': accessibleName},
  [
    phoneFrame(image: project.preview, alt: project.name),
    div(classes: 'project-card__title', [
      h3(classes: 'project-card__name t-headline-small', [.text(project.name)]),
      if (project.platform != null) platformTag(project.platform!),
    ]),
    if (project.summary.isNotEmpty) p(classes: 'project-card__summary t-body-small', multiline(project.summary)),
    if (project.stack.isNotEmpty)
      div(classes: 'project-card__tags', [
        for (final tag in project.stack.take(3)) tagChip(tag, outlined: true, small: true),
      ]),
  ],
);

/// What the card shows, for its accessible name: summary, platform, stack.
/// The same as Flutter's `ProjectCard._details`.
String projectCardDetails(ProjectModel project) => [
  if (project.summary.isNotEmpty) project.summary,
  if (project.platform != null) project.platform!.label,
  if (project.stack.isNotEmpty) project.stack.join(', '),
].join('. ');

/// A project as a wide card linking to its page: the screenshot on the left;
/// the name with the platform tag, the summary, the spheres, the
/// technologies and the stores it shipped to on the right (spheres and
/// technologies hidden on phones). Flutter's `ProjectCard.horizontal`.
Component projectCardHorizontal(
  ProjectModel project, {
  required String href,
  required String accessibleName,
  required List<String> stores,
}) => a(
  href: href,
  classes: 'project-card project-card--horizontal',
  attributes: {'aria-label': accessibleName, 'data-platform': project.platform?.name ?? 'none'},
  [
    div(classes: 'project-card__frame', [
      phoneFrame(image: project.preview, alt: project.name, size: PhoneFrameSize.cardHorizontal),
    ]),
    div(classes: 'project-card__text', [
      div(classes: 'project-card__title project-card__title--wrap', [
        h3(classes: 'project-card__name t-headline-small', [.text(project.name)]),
        if (project.platform != null) platformTag(project.platform!),
      ]),
      if (project.summary.isNotEmpty)
        p(classes: 'project-card__summary t-body-small t-tablet-body-medium', multiline(project.summary)),
      if (project.spheres.isNotEmpty)
        p(classes: 'project-card__spheres t-body-small', [.text(project.spheres.join(' · '))]),
      if (project.stack.isNotEmpty)
        div(classes: 'project-card__tags', [
          for (final tag in project.stack.take(4)) tagChip(tag, outlined: true, small: true),
        ]),
      if (stores.isNotEmpty) p(classes: 'project-card__stores t-label-medium', [.text(stores.join(' · '))]),
    ]),
  ],
);
