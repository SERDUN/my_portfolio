import 'package:domain/domain.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:presentation/presentation.dart';

import '../../app/site_content.dart';
import '../../app/site_paths.dart';
import '../../components/chips.dart';
import '../../components/icons.dart';
import '../../components/layout.dart';
import '../../components/pill_button.dart';
import '../../components/project_card.dart';

/// One project: the back link, the hero with the store buttons and the lead
/// screenshot, the description and stack, the screenshot gallery, and the
/// next project. Flutter's `ProjectPage`.
Component projectPage(SiteContent content, ProjectState state) {
  final strings = content.strings;
  final language = content.language;
  final project = state.project!;
  final next = state.nextProject;

  return contentWidth(tag: 'article', classes: 'project', [
    pillButton(
      label: strings.common_allProjects,
      href: SitePaths.projects(language),
      icon: AppIcon.arrowBack,
      iconLeading: true,
      variant: PillVariant.ghost,
      classes: 'project__back',
    ),
    _hero(content, project),
    _about(content, project),
    if (project.screenshots.isNotEmpty) _gallery(content, project),
    if (next != null)
      div(classes: 'project-next', [
        span(classes: 'project-next__label t-body-medium', [.text(strings.project_next)]),
        a(
          href: SitePaths.project(language, next.id),
          classes: 'project-next__link',
          attributes: {'aria-label': strings.project_semanticsLabel_nextProject(next.name)},
          [
            span(classes: 't-headline-small', [.text(next.name)]),
            appIcon(AppIcon.arrowForward, size: 22),
          ],
        ),
      ]),
  ]);
}

Component _hero(SiteContent content, ProjectModel project) {
  final strings = content.strings;
  final platform = project.platform;
  final links = project.links;

  final platformNames = [
    for (final published in publishedPlatforms(project))
      switch (published) {
        PublishedPlatform.ios => strings.project_platformIos,
        PublishedPlatform.android => strings.project_platformAndroid,
        PublishedPlatform.web => strings.project_platformWeb,
      },
  ];

  Component fact(String label, String value) => div(classes: 'project-fact', [
    span(classes: 'project-fact__label t-label-small', [.text(label.toUpperCase())]),
    span(classes: 't-title-medium', [.text(value)]),
  ]);

  return div(classes: 'project-hero', [
    div(classes: 'project-hero__copy', [
      if (platform != null || project.spheres.isNotEmpty)
        div(classes: 'project-hero__tags', [
          if (platform != null) platformTag(platform),
          if (project.spheres.isNotEmpty) span(classes: 't-body-small', [.text(project.spheres.join(' · '))]),
        ]),
      h1(classes: 'project-hero__name t-display-small t-tablet-display-large', [.text(project.name)]),
      if (project.intro.isNotEmpty) p(classes: 'project-hero__intro', multiline(project.intro)),
      if (!links.isEmpty)
        div(classes: 'project-hero__stores', [
          if (links.appStore != null)
            pillButton(
              label: strings.common_appStore,
              href: links.appStore.toString(),
              icon: AppIcon.appStore,
              variant: PillVariant.ink,
              external: true,
            ),
          if (links.googlePlay != null)
            pillButton(
              label: strings.common_googlePlay,
              href: links.googlePlay.toString(),
              icon: AppIcon.googlePlay,
              variant: links.appStore == null ? PillVariant.ink : PillVariant.outline,
              external: true,
            ),
          if (links.github != null)
            pillButton(
              label: strings.common_github,
              href: links.github.toString(),
              icon: AppIcon.github,
              variant: links.hasStore ? PillVariant.outline : PillVariant.ink,
              external: true,
            ),
        ]),
      div(classes: 'project-hero__facts', [
        fact(
          strings.project_factPlatforms,
          platformNames.isNotEmpty ? platformNames.join(', ') : (platform?.label ?? '—'),
        ),
        fact(strings.project_factStack, '${project.technologies.length}'),
        fact(strings.project_factScreens, '${project.screenshots.length}'),
      ]),
    ]),
    div(classes: 'project-hero__frame', [
      phoneFrame(image: project.preview, alt: project.name, size: PhoneFrameSize.hero),
    ]),
  ]);
}

Component _about(SiteContent content, ProjectModel project) {
  final strings = content.strings;
  return div(classes: 'project-about', [
    div(classes: 'project-about__text', [
      h2(classes: 't-headline-large', [.text(strings.project_aboutTitle)]),
      p(classes: 't-body-large', multiline(project.description)),
    ]),
    div(classes: 'project-about__stack', [
      h2(classes: 't-headline-large', [.text(strings.project_stackTitle)]),
      div(classes: 'chip-wrap', [for (final tech in project.technologies) tagChip(tech)]),
    ]),
  ]);
}

Component _gallery(SiteContent content, ProjectModel project) {
  final strings = content.strings;
  final shots = project.screenshots;
  return div(classes: 'project-gallery', [
    div(classes: 'project-gallery__header', [
      h2(classes: 't-headline-large', [.text(strings.project_screenshotsTitle)]),
      span(classes: 't-body-small', [.text(strings.project_screensCount(shots.length))]),
    ]),
    div(classes: 'project-gallery__grid', [
      for (final (index, shot) in shots.indexed)
        div(classes: 'project-shot', [
          div(classes: 'project-shot__bezel', [
            img(src: shot.toString(), alt: '${project.name} ${index + 1}', loading: MediaLoading.lazy),
          ]),
        ]),
    ]),
  ]);
}
