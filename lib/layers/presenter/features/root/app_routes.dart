import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../application/route/app_route_consts.dart';
import '../../pages/host/pages/contact/contact_page.dart';
import '../../pages/host/pages/home/home_page.dart';
import '../../pages/host/pages/portfolio/details/project_details_page.dart';
import '../../pages/host/pages/portfolio/projects/portfolio_page.dart';
import 'main_screen.dart';
import 'not_found_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutInfo.resume.path,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
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
