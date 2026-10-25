import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import 'app_frame.dart';
import 'app_router.dart';
import 'app_use_cases.dart';
import 'settings/settings.dart';

/// The composition root: the only widget that reads the container. It
/// resolves the use cases once, owns the settings cubit and the router, and
/// hands all three to [AppView].
class Application extends StatefulWidget {
  const Application({super.key, required this.di});

  final GetIt di;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late final AppUseCases _useCases = AppUseCases(
    getUser: widget.di(),
    getUserSkills: widget.di(),
    getContacts: widget.di(),
    getProjects: widget.di(),
    getProjectById: widget.di(),
    getUsefulCommands: widget.di(),
  );
  final AppSettingsCubit _settings = AppSettingsCubit();
  late final GoRouter _router = buildAppRouter();

  @override
  void dispose() {
    _router.dispose();
    _settings.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AppView(useCases: _useCases, settings: _settings, router: _router);
}

/// The app as it ships, minus the container: use cases through
/// RepositoryProviders, settings through a BlocProvider, and the one
/// MaterialApp configuration. Widget tests pump this with fakes.
class AppView extends StatelessWidget {
  const AppView({super.key, required this.useCases, required this.settings, required this.router});

  final AppUseCases useCases;
  final AppSettingsCubit settings;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: useCases.providers,
      child: BlocProvider.value(
        value: settings,
        child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, state) => MaterialApp.router(
            builder: appFrameBuilder,
            localizationsDelegates: const [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
            supportedLocales: supportedLocales,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: state.themeMode,
            locale: state.locale,
            restorationScopeId: 'application',
            title: 'Dmytro Serdun',
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          ),
        ),
      ),
    );
  }
}
