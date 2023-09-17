import 'package:flutter/material.dart';

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

class Application extends StatefulWidget {
  const Application({
    Key? key,
    required this.di,
  }) : super(key: key);

  final GetIt di;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final ThemeModelNotifier _styleNotifier = ThemeModelNotifier();
  late final LanguageNotifier _languageNotifier = LanguageNotifier((locale) {
    di<Config>().setCurrentLocale = locale.languageCode;
  });

  late final GoRouter _router = _buildRouting();

  get di => widget.di;

  @override
  Widget build(BuildContext context) {
    return LanguageProvider(
      notifier: _languageNotifier,
      child: ThemeModeProvider(
        notifier: _styleNotifier,
        child: Builder(
          builder: (context) {
            final languageNotifier = LanguageProvider.watch(context);
            final themeModeNotifier = ThemeModeProvider.watch(context);
            return MaterialApp.router(
              builder: (context, child) => ResponsiveBreakpoints.builder(
                child: MaxWidthBox(
                  maxWidth: 1200,
                  background: Container(color: Theme.of(context).colorScheme.surface),
                  child: BouncingScrollWrapper.builder(context, child!, dragWithMouse: true),
                ),
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              ),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('uk', ''),
              ],
              theme: FlexThemeData.light(
                scheme: FlexScheme.espresso,
                fontFamily: GoogleFonts.gentiumPlus().fontFamily,
              ),
              darkTheme: FlexThemeData.dark(
                scheme: FlexScheme.espresso,
                fontFamily: GoogleFonts.gentiumPlus().fontFamily,
              ),
              themeMode: themeModeNotifier?.themeModeNotifier.themeMode,
              restorationScopeId: "application",
              locale: languageNotifier?.languageNotifier.currentLocale,
              title: "Dmitro Serdun",
              debugShowCheckedModeBanner: false,
              routerConfig: _router,
            );
          },
        ),
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
                return MainScreen(
                  navigationShell: navigationShell,
                  key: ValueKey(state.pageKey),
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
                          _languageNotifier,
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
                        create: (BuildContext context) => ProjectsCubit(
                          di<GetProjectsUseCase>(),
                          _languageNotifier,
                        ),
                        child: const PortfolioPage(),
                      ),
                      routes: [
                        GoRoute(
                          path: AppRoutInfo.project.path,
                          name: AppRoutInfo.project.name,
                          builder: (context, state) => BlocProvider<ProjectCubit>(
                            create: (BuildContext context) => ProjectCubit(
                              di<GetProjectByIdUseCase>(),
                              _languageNotifier,
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
                        create: (BuildContext context) => ContactsCubit(
                          di<GetContactsUseCase>(),
                          _languageNotifier,
                        ),
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
                        create: (BuildContext context) => UsefulCubit(
                          di<GetUsefulCommandsUseCase>(),
                          _languageNotifier,
                        ),
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
