import 'package:material_ui/material_ui.dart';

import 'package:go_router/go_router.dart';

import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../widgets/widgets.dart';

/// Shell around the four top-level pages: the site header on top, the current
/// branch of the [StatefulNavigationShell] below.
class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  static const _destinations = ShellDestination.values;

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeProvider.watch(context);
    final language = LanguageProvider.watch(context);
    final index = navigationShell.currentIndex.clamp(0, _destinations.length - 1);

    return Scaffold(
      appBar: SiteHeader(
        current: _destinations[index],
        onNavigate: (destination) => navigationShell.goBranch(
          destination.index,
          initialLocation: destination.index == navigationShell.currentIndex,
        ),
        themeMode: themeMode?.themeModeNotifier.themeMode ?? ThemeMode.system,
        onThemeChange: (mode) => themeMode?.setThemeMode(mode),
        locale: language?.languageNotifier.currentLocale ?? Localizations.localeOf(context),
        onLocaleChange: (locale) => language?.setLocale(locale),
      ),
      body: navigationShell,
    );
  }
}
