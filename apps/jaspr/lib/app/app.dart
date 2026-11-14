import 'package:domain/domain.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:presentation/presentation.dart';

import '../features/home/home_page.dart';
import '../features/shell/site_header.dart';
import 'site_content.dart';
import 'site_page.dart';
import 'site_paths.dart';

/// Root of the Jaspr presenter: one route per page and language, every one
/// pre-rendered at build time (jaspr_router registers each route for static
/// generation, which is why a page per project will be listed explicitly).
class App extends StatelessComponent {
  const App({required this.content, super.key});

  final Map<Language, SiteContent> content;

  @override
  Component build(BuildContext context) {
    return Router(
      routes: [
        for (final language in Language.values)
          Route(path: SitePaths.home(language), builder: (context, state) => _home(content[language]!)),
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
}
