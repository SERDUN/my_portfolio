import 'package:go_router/go_router.dart';
import '../features/bio/screen/home_page.dart';
import '../features/contact/screen/contact_page.dart';

import '../features/project/screen/project_details_page.dart';
import '../features/projects/screen/portfolio_page.dart';
import '../features/root/main_screen.dart';
import '../common/widgets/text/not_found_page.dart';

import 'app_route_consts.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutInfo.resume.path,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(screen: child);
        },
        routes: [
          GoRoute(
            path: AppRoutInfo.resume.path,
            name: AppRoutInfo.resume.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
              path: AppRoutInfo.portfolio.path,
              name: AppRoutInfo.portfolio.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                    child: PortfolioPage(),
                  ),
              routes: [
                GoRoute(
                  path: AppRoutInfo.project.path,
                  name: AppRoutInfo.project.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: ProjectDetailsPage(
                      id: state.params[AppRoutInfo.projectId]!,
                    ),
                  ),
                ),
              ]),
          GoRoute(
            path: AppRoutInfo.contacts.path,
            name: AppRoutInfo.contacts.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ContactPage(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}
