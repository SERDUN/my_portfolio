import 'package:domain/domain.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:presentation/presentation.dart';

import '../../app/site_content.dart';
import '../../app/site_paths.dart';
import '../../components/icons.dart';
import '../../components/layout.dart';
import '../../components/page_intro.dart';
import '../../components/pill_button.dart';
import '../../components/project_card.dart';

/// All projects: a statement header, a platform filter and the wide cards.
/// Flutter's `ProjectsPage`.
///
/// The filter is a group of radio buttons styled as chips; web/styles.css
/// hides the cards of the other platforms with `:has()`, so it works without
/// any script, and every card is in the HTML for a reader that has none.
Component projectsPage(SiteContent content) {
  final strings = content.strings;
  final language = content.language;
  final state = content.projects;
  final projects = state.projects;
  final platforms = state.platformCounts;

  Component filterChip(String value, String text, {required bool checked}) =>
      label(classes: 'filter-chip t-label-medium', [
        input(
          type: InputType.radio,
          name: 'platform',
          value: value,
          classes: 'filter-chip__input',
          attributes: {if (checked) 'checked': ''},
        ),
        span([.text(text)]),
      ]);

  List<String> stores(ProjectModel project) => [
    if (project.links.googlePlay != null) strings.common_googlePlay,
    if (project.links.appStore != null) strings.common_appStore,
    if (project.links.github != null) strings.common_github,
  ];

  return contentWidth(tag: 'section', classes: 'projects', [
    div(classes: 'projects__header', [
      pageIntro(
        eyebrowText: strings.projects_eyebrow,
        title: strings.projects_title(projects.length, platforms.length),
        description: strings.projects_description,
      ),
      div(
        classes: 'projects__filter',
        attributes: {'role': 'radiogroup', 'aria-label': strings.projects_eyebrow},
        [
          filterChip('all', '${strings.projects_filterAll} · ${projects.length}', checked: true),
          for (final MapEntry(key: platform, value: count) in platforms.entries)
            filterChip(platform.name, '${platform.label} · $count', checked: false),
        ],
      ),
    ]),
    div(classes: 'projects__grid', [
      for (final project in projects)
        projectCardHorizontal(
          project,
          href: SitePaths.project(language, project.id),
          accessibleName: strings.projects_semanticsLabel_openProject(project.name, projectCardDetails(project)),
          stores: stores(project),
        ),
    ]),
    div(classes: 'projects__cta', [
      pillButton(
        label: strings.projects_cta,
        href: SitePaths.contacts(language),
        icon: AppIcon.arrowForward,
        variant: PillVariant.ghost,
      ),
    ]),
  ]);
}
