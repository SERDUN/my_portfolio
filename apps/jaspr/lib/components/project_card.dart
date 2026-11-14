import 'package:domain/domain.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:presentation/presentation.dart';

import 'chips.dart';
import 'layout.dart';

/// A phone screenshot rising out of a soft well: dark bezel, rounded top
/// corners, cut at the bottom of the well. Flutter's `PhoneFrame` at its
/// default size (300 px well, 220 px phone).
Component phoneFrame({required Uri? image, required String alt}) => div(classes: 'phone-frame', [
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
