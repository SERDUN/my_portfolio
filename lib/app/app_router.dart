import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/features/features.dart';

import 'app_route_consts.dart';
import 'settings/settings.dart';

/// The route tree. Every page builds its cubit from the widget tree
/// (`context.read`): use cases come from the RepositoryProviders the app root
/// publishes, the language from [AppSettingsCubit]. No service locator here.
GoRouter buildAppRouter() {
  return GoRouter(
    initialLocation: AppRoutInfo.resume.path,
    debugLogDiagnostics: kDebugMode,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => BlocProvider(
          create: (context) => ShellCubit(context.read(), context.read(), context.read<AppSettingsCubit>()),
          child: MainScreen(navigationShell: navigationShell, key: ValueKey(state.pageKey)),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutInfo.resume.path,
                builder: (context, state) => BlocProvider(
                  create: (context) =>
                      BioCubit(context.read(), context.read(), context.read(), context.read<AppSettingsCubit>()),
                  child: const HomePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutInfo.portfolio.path,
                builder: (context, state) => BlocProvider(
                  create: (context) => ProjectsCubit(context.read(), context.read<AppSettingsCubit>()),
                  child: const PortfolioPage(),
                ),
                routes: [
                  GoRoute(
                    path: AppRoutInfo.project.path,
                    name: AppRoutInfo.project.name,
                    builder: (context, state) => BlocProvider(
                      create: (context) => ProjectCubit(
                        context.read(),
                        context.read(),
                        context.read<AppSettingsCubit>(),
                        state.pathParameters[AppRoutInfo.projectId]!,
                      ),
                      child: const ProjectDetailsPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutInfo.contacts.path,
                builder: (context, state) => BlocProvider(
                  create: (context) => ContactsCubit(context.read(), context.read<AppSettingsCubit>()),
                  child: const ContactPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutInfo.useful.path,
                builder: (context, state) => BlocProvider(
                  create: (context) => UsefulCubit(context.read(), context.read<AppSettingsCubit>()),
                  child: const HelpScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
