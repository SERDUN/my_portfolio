import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:my_portfolio/app/settings/settings.dart';

import '../widgets/widgets.dart';

/// Shell around the four top-level pages: the site header on top, the current
/// branch of the [StatefulNavigationShell] below.
class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _destinations = ShellDestination.values;

  @override
  Widget build(BuildContext context) {
    final settings = context.read<AppSettingsCubit>();
    final themeMode = context.select((AppSettingsCubit c) => c.state.themeMode);
    final language = context.select((AppSettingsCubit c) => c.state.language);
    final index = navigationShell.currentIndex.clamp(0, _destinations.length - 1);

    return Scaffold(
      appBar: SiteHeader(
        current: _destinations[index],
        onNavigate: (destination) => navigationShell.goBranch(
          destination.index,
          initialLocation: destination.index == navigationShell.currentIndex,
        ),
        themeMode: themeMode,
        onThemeChange: settings.changeThemeMode,
        language: language,
        onLanguageChange: settings.changeLanguage,
      ),
      body: navigationShell,
    );
  }
}
