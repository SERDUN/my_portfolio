import 'package:domain/services/services.dart';
import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'app/app.dart';
import 'core/app_environment_keys.dart';
import 'core/widgets/widgets.dart';
import 'di/injection.dart';
import 'features/features.dart';
import 'localization/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy());
  await configureDependencies(AppEnvironmentKey.dev);
  runApp(const DataProvider());
}

class DataProvider extends StatelessWidget {
  const DataProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BioCubit>(
          create: (BuildContext context) => BioCubit(
            di<GetUserUseCase>(),
            di.get(),
          ),
        ),
        BlocProvider<ProjectsBloc>(
          create: (BuildContext context) => ProjectsBloc(di<GetProjectsUseCase>()),
        ),
        BlocProvider<ProjectDetailsBloc>(
          create: (BuildContext context) => ProjectDetailsBloc(di<GetProjectByIdUseCase>()),
        ),
        BlocProvider<ContactsBloc>(
          create: (BuildContext context) => ContactsBloc(di<GetContactsUseCase>()),
        ),
      ],
      child: Builder(
        builder: (context) => const Application(),
      ),
    );
  }
}

class Application extends StatefulWidget {
  const Application({
    Key? key,
  }) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();

  static _ApplicationState of(BuildContext context) => context.findAncestorStateOfType<_ApplicationState>()!;
}

class _ApplicationState extends State<Application> {
  Locale _locale = const Locale("en", '');

  void setLocale(Locale value) {
    di.get<LocalizationService>().locale = value.languageCode;
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      themeMode: ThemeMode.dark,
      restorationScopeId: "application",
      locale: _locale,
      title: "Dmitro Serdun",
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        debugLog: false,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(320, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScaleDown(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
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
      ),
    );
  }
}
