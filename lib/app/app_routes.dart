import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/widgets/widgets.dart';
import '../features/features.dart';

import 'app_route_consts.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutInfo.resume.path,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return child;
        },
        routes: [
          StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
              return MainScreen(navigationShell: navigationShell);
            },
            branches: <StatefulShellBranch>[
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: AppRoutInfo.resume.path,
                    builder: (BuildContext context, GoRouterState state) => const HomePage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                      path: AppRoutInfo.portfolio.path,
                      builder: (BuildContext context, GoRouterState state) => const PortfolioPage(),
                      routes: [
                        GoRoute(
                          path: AppRoutInfo.project.path,
                          name: AppRoutInfo.project.name,
                          pageBuilder: (context, state) => NoTransitionPage(
                            child: ProjectDetailsPage(
                              id: state.pathParameters[AppRoutInfo.projectId]!,
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: AppRoutInfo.contacts.path,
                    builder: (BuildContext context, GoRouterState state) => const ContactPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}
