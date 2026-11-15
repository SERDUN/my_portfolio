import 'package:domain/domain.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:presentation/presentation.dart';

import '../features/contacts/contacts_page.dart';
import '../features/home/home_page.dart';
import '../features/project/project_page.dart';
import '../features/projects/projects_page.dart';
import '../features/useful/useful_page.dart';
import '../features/shell/site_header.dart';
import 'site_content.dart';
import 'site_page.dart';
import 'site_paths.dart';

/// Root of the Jaspr presenter: one route per page and language, every one
/// pre-rendered at build time (jaspr_router registers each route for static
/// generation, which takes no path parameters, so every project page is
/// listed by its id).
class App extends StatelessComponent {
  const App({required this.content, super.key});

  final Map<Language, SiteContent> content;

  @override
  Component build(BuildContext context) {
    return Router(
      routes: [
        for (final language in Language.values) ...[
          Route(path: SitePaths.home(language), builder: (context, state) => _home(content[language]!)),
          Route(path: SitePaths.contacts(language), builder: (context, state) => _contacts(content[language]!)),
          Route(path: SitePaths.useful(language), builder: (context, state) => _useful(content[language]!)),
          Route(path: SitePaths.projects(language), builder: (context, state) => _projects(content[language]!)),
          for (final MapEntry(key: id, value: page) in content[language]!.projectPages.entries)
            Route(
              path: SitePaths.project(language, id),
              builder: (context, state) => _project(content[language]!, page),
            ),
        ],
      ],
    );
  }

  static Component _home(SiteContent content) => sitePage(
    content,
    current: ShellDestination.home,
    route: AppRoutes.home.path,
    title: content.user.name,
    description: content.user.intro,
    child: homePage(content),
  );

  static Component _projects(SiteContent content) => sitePage(
    content,
    current: ShellDestination.projects,
    route: AppRoutes.projects.path,
    title: '${content.strings.shell_navProjects} · ${content.user.name}',
    description: content.strings.projects_description,
    child: projectsPage(content),
  );

  static Component _project(SiteContent content, ProjectState page) {
    final project = page.project!;
    return sitePage(
      content,
      current: ShellDestination.projects,
      route: '${AppRoutes.projects.path}/${project.id}',
      title: '${project.name} · ${content.user.name}',
      description: project.summary,
      child: projectPage(content, page),
    );
  }

  static Component _contacts(SiteContent content) => sitePage(
    content,
    current: ShellDestination.contacts,
    route: AppRoutes.contacts.path,
    title: '${content.strings.contacts_title} · ${content.user.name}',
    description: content.strings.contacts_description,
    child: contactsPage(content),
  );

  static Component _useful(SiteContent content) => sitePage(
    content,
    current: ShellDestination.useful,
    route: AppRoutes.useful.path,
    title: '${content.strings.useful_title} · ${content.user.name}',
    description: content.strings.useful_description,
    child: usefulPage(content),
  );
}
