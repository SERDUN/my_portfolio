import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/style/style.dart';
import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/features/features.dart';
import 'package:my_portfolio/localization/localization.dart';

import 'app_route_consts.dart';
import 'settings/settings.dart';

const List<Breakpoint> _breakpoints = [
  Breakpoint(start: 0, end: 450, name: MOBILE),
  Breakpoint(start: 451, end: 800, name: TABLET),
  Breakpoint(start: 801, end: 1920, name: DESKTOP),
  Breakpoint(start: 1921, end: double.infinity, name: '4K'),
];

class Application extends StatefulWidget {
  const Application({super.key, required this.di});

  final GetIt di;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final AppSettingsCubit _settings = AppSettingsCubit();

  late final GoRouter _router = _buildRouting();

  GetIt get di => widget.di;

  @override
  void dispose() {
    _settings.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _settings,
      child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (context, settings) {
          return MaterialApp.router(
            // Bridges ThemeData and MaterialLocalizations to packages that
            // still import package:flutter/material.dart (responsive_framework,
            // carousel_slider, octo_image, flutter_blurhash). Deprecated by
            // design: drop it once those packages move to material_ui.
            // ignore: deprecated_member_use
            builder: (context, child) => MaterialUiCompatibilityBridge(
              child: ResponsiveBreakpoints.builder(
                child: BouncingScrollWrapper.builder(context, child!, dragWithMouse: true),
                breakpoints: _breakpoints,
              ),
            ),
            localizationsDelegates: [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
            supportedLocales: supportedLocales,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: settings.themeMode,
            restorationScopeId: "application",
            locale: settings.locale,
            title: "Dmitro Serdun",
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
          );
        },
      ),
    );
  }

  GoRouter _buildRouting() {
    return GoRouter(
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
                return BlocProvider<ShellCubit>(
                  create: (_) => ShellCubit(di<GetUserUseCase>(), di<GetContactsUseCase>(), _settings),
                  child: MainScreen(navigationShell: navigationShell, key: ValueKey(state.pageKey)),
                );
              },
              branches: <StatefulShellBranch>[
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: AppRoutInfo.resume.path,
                      builder: (BuildContext context, GoRouterState state) => BlocProvider<BioCubit>(
                        create: (BuildContext context) => BioCubit(
                          di<GetUserUseCase>(),
                          di<GetUserSkillsUseCase>(),
                          di<GetProjectsUseCase>(),
                          _settings,
                        ),
                        child: const HomePage(),
                      ),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: AppRoutInfo.portfolio.path,
                      builder: (BuildContext context, GoRouterState state) => BlocProvider<ProjectsCubit>(
                        create: (BuildContext context) => ProjectsCubit(di<GetProjectsUseCase>(), _settings),
                        child: const PortfolioPage(),
                      ),
                      routes: [
                        GoRoute(
                          path: AppRoutInfo.project.path,
                          name: AppRoutInfo.project.name,
                          builder: (context, state) => BlocProvider<ProjectCubit>(
                            create: (BuildContext context) => ProjectCubit(
                              di<GetProjectByIdUseCase>(),
                              di<GetProjectsUseCase>(),
                              _settings,
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
                  routes: <RouteBase>[
                    GoRoute(
                      path: AppRoutInfo.contacts.path,
                      builder: (BuildContext context, GoRouterState state) => BlocProvider<ContactsCubit>(
                        create: (BuildContext context) => ContactsCubit(di<GetContactsUseCase>(), _settings),
                        child: const ContactPage(),
                      ),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: AppRoutInfo.useful.path,
                      builder: (BuildContext context, GoRouterState state) => BlocProvider<UsefulCubit>(
                        create: (BuildContext context) => UsefulCubit(di<GetUsefulCommandsUseCase>(), _settings),
                        child: const HelpScreen(),
                      ),
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
  }
}
