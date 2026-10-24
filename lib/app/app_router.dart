import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/features/features.dart';

import 'app_routes.dart';
import 'contacts/contacts.dart';
import 'settings/settings.dart';

/// The route tree. Every page builds its cubit from the widget tree
/// (`context.read`): use cases come from the RepositoryProviders the app root
/// publishes, the language from [AppSettingsCubit]. No service locator here.
GoRouter buildAppRouter() {
  return GoRouter(
    initialLocation: AppRoutes.home.path,
    debugLogDiagnostics: kDebugMode,
    routes: [
      StatefulShellRoute.indexedStack(
        // Shared by every page below: the owner for the header, the contacts
        // for the footer and the contacts page. Each loads once.
        builder: (context, state, navigationShell) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ShellCubit(context.read(), context.read<AppSettingsCubit>())),
            BlocProvider(create: (context) => ContactsCubit(context.read(), context.read<AppSettingsCubit>())),
          ],
          child: ShellPage(navigationShell: navigationShell, key: ValueKey(state.pageKey)),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home.path,
                name: AppRoutes.home.name,
                builder: (context, state) => BlocProvider(
                  create: (context) =>
                      HomeCubit(context.read(), context.read(), context.read(), context.read<AppSettingsCubit>()),
                  child: const HomePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.projects.path,
                name: AppRoutes.projects.name,
                builder: (context, state) => BlocProvider(
                  create: (context) => ProjectsCubit(context.read(), context.read<AppSettingsCubit>()),
                  child: const ProjectsPage(),
                ),
                routes: [
                  GoRoute(
                    path: AppRoutes.project.path,
                    name: AppRoutes.project.name,
                    builder: (context, state) => BlocProvider(
                      create: (context) => ProjectCubit(
                        context.read(),
                        context.read(),
                        context.read<AppSettingsCubit>(),
                        state.pathParameters[AppRoutes.projectIdParam]!,
                      ),
                      child: const ProjectPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.contacts.path,
                name: AppRoutes.contacts.name,
                // Contacts come from the ContactsCubit above every page.
                builder: (context, state) => const ContactsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.useful.path,
                name: AppRoutes.useful.name,
                builder: (context, state) => BlocProvider(
                  create: (context) => UsefulCubit(context.read(), context.read<AppSettingsCubit>()),
                  child: const UsefulCommandsPage(),
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
