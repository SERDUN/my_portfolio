import 'package:domain/domain.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../app/site_content.dart';
import '../../app/site_paths.dart';
import '../../components/chips.dart';
import '../../components/icons.dart';
import '../../components/layout.dart';
import '../../components/pill_button.dart';
import '../../components/project_card.dart';

/// Home: hero with the portrait and stats, the career timeline, skills as
/// chips, selected work. Flutter's `HomePage`.
Component homePage(SiteContent content) {
  final home = content.home;
  final user = content.user;
  return div(classes: 'home', [
    _hero(content, user, projectCount: home.projects.length, platformCount: home.platformCount),
    if (user.experience.isNotEmpty) _experience(content, user.experience),
    _skills(content, home.skills ?? const []),
    if (home.featuredProjects.isNotEmpty)
      _selectedWork(content, home.featuredProjects, totalCount: home.projects.length),
  ]);
}

Component _hero(SiteContent content, PortfolioUserModel user, {required int projectCount, required int platformCount}) {
  final strings = content.strings;
  final eyebrowText = [user.position, user.location].where((part) => part.isNotEmpty).join(' · ');
  final years = user.yearsOfExperience();

  Component stat(String value, String label) => div(classes: 'stat-tile', [
    span(classes: 'stat-tile__value t-headline-large', [.text(value)]),
    span(classes: 't-label-small', [.text(label)]),
  ]);

  return contentWidth(tag: 'section', classes: 'hero', [
    div(classes: 'hero__copy', [
      if (eyebrowText.isNotEmpty) eyebrow(eyebrowText),
      h1(classes: 'hero__headline t-display-small t-tablet-display-large', _headline(user)),
      p(classes: 'hero__intro t-body-large', multiline(user.intro)),
      div(classes: 'hero__actions', [
        pillButton(
          label: strings.common_downloadCv,
          href: user.cv?.toString(),
          icon: AppIcon.arrowDownward,
          external: true,
        ),
        pillButton(
          label: strings.home_seeProjects,
          href: SitePaths.projects(content.language),
          icon: AppIcon.arrowForward,
          variant: PillVariant.outline,
        ),
      ]),
    ]),
    div(classes: 'hero__portrait', [
      div(classes: 'portrait', [
        div(classes: 'portrait__frame', [if (user.avatar != null) img(src: user.avatar.toString(), alt: user.name)]),
      ]),
      div(classes: 'hero__stats', [
        stat(years == null ? '—' : '$years+', strings.home_statsYears),
        stat('$projectCount', strings.home_statsProjects),
        stat('$platformCount', strings.home_statsPlatforms),
      ]),
    ]),
  ]);
}

/// The headline with its accent tail set italic in the accent colour, as
/// Flutter's `_HeroCopy._headlineSpan` splits it.
List<Component> _headline(PortfolioUserModel user) {
  final headline = user.headline;
  if (headline.isEmpty) return [.text(user.name)];
  final accent = user.headlineAccent;
  final index = accent.isEmpty ? -1 : headline.lastIndexOf(accent);
  if (index < 0) return [.text(headline)];
  return [
    .text(headline.substring(0, index)),
    em(classes: 'hero__accent', [.text(accent)]),
    .text(headline.substring(index + accent.length)),
  ];
}

Component _experience(SiteContent content, List<ExperienceModel> experience) {
  final strings = content.strings;
  return contentWidth(tag: 'section', classes: 'home-section', [
    sectionHeader(
      eyebrowText: strings.home_experienceEyebrow,
      title: strings.home_experienceTitle,
      description: strings.home_experienceDescription,
    ),
    div(classes: 'experience', [
      for (final item in experience)
        article(classes: 'experience-row', [
          span(classes: 'experience-row__period t-label-medium', [.text(item.period)]),
          div(classes: 'experience-row__body', [
            h3(classes: 't-headline-small', [.text(item.company)]),
            p(classes: 'experience-row__role t-body-medium', [
              .text([item.role, item.terms].where((part) => part.isNotEmpty).join(' · ')),
            ]),
            if (item.summary.isNotEmpty) p(classes: 'experience-row__summary t-body-medium', multiline(item.summary)),
            if (item.highlights.isNotEmpty)
              ul(classes: 'experience-row__highlights', [
                for (final line in item.highlights) li(classes: 't-body-medium', [span(multiline(line))]),
              ]),
          ]),
        ]),
    ]),
  ]);
}

Component _skills(SiteContent content, List<SkillGroupModel> skills) {
  final strings = content.strings;
  return contentWidth(tag: 'section', classes: 'home-section', [
    sectionHeader(
      eyebrowText: strings.home_skillsEyebrow,
      title: strings.home_skillsTitle,
      description: strings.home_skillsDescription,
    ),
    div(classes: 'home-section__body', [
      responsiveGrid([
        for (final group in skills)
          div(classes: 'card skill-group', [
            div(classes: 'skill-group__title', [
              h3(classes: 't-headline-small', [.text(group.title)]),
              span(classes: 't-label-small', [.text('${group.skills.length}')]),
            ]),
            div(classes: 'chip-wrap', [for (final skill in group.skills) tagChip(skill.title)]),
          ]),
      ]),
    ]),
  ]);
}

Component _selectedWork(SiteContent content, List<ProjectModel> projects, {required int totalCount}) {
  final strings = content.strings;
  final language = content.language;
  return contentWidth(tag: 'section', classes: 'home-section home-section--last', [
    sectionHeader(
      eyebrowText: strings.home_selectedWorkEyebrow,
      title: strings.home_selectedWorkTitle,
      trailing: pillButton(
        label: strings.home_allProjects(totalCount),
        href: SitePaths.projects(language),
        icon: AppIcon.arrowForward,
        variant: PillVariant.ghost,
      ),
    ),
    div(classes: 'home-section__body', [
      responsiveGrid([
        for (final project in projects.take(3))
          projectCard(
            project,
            href: SitePaths.project(language, project.id),
            accessibleName: strings.projects_semanticsLabel_openProject(project.name, projectCardDetails(project)),
          ),
      ]),
    ]),
  ]);
}
