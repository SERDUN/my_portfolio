import 'dart:math';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    ThemeModeProvider? themeMode = ThemeModeProvider.read(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kMinInteractiveDimension,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        title: const Text("Dmitro Serdun"),
        leadingWidth: 72,
        leading: Row(
          children: [
            const SizedBox(width: 8),
            SwitcherLanguage(
              localizationChanged: () => _changeLanguage(context),
            ),
            const SizedBox(width: 8),
            ThemeModeSwitcher(
              themeMode: themeMode!.themeModeNotifier.themeMode,
              onThemeChange: (mode) => themeMode.setThemeMode(mode),
            )
          ],
        ),
        actions: [
          ActionTab(
            isSelected: navigationShell.currentIndex == 0,
            onTab: () => navigationShell.goBranch(0),
            title: context.l10n.menuTitleHome,
          ),
          ActionTab(
            isSelected: navigationShell.currentIndex == 1,
            onTab: () => navigationShell.goBranch(1),
            title: context.l10n.menuTitlePortfolio,
          ),
          ActionTab(
            isSelected: navigationShell.currentIndex == 2,
            onTab: () => navigationShell.goBranch(2),
            title: context.l10n.menuTitleContact,
          ),
          ActionTab(
            isSelected: navigationShell.currentIndex == 3,
            onTab: () => navigationShell.goBranch(3),
            title: context.l10n.menuTitleUseful,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
      body: navigationShell,
    );
  }

  void _changeLanguage(BuildContext context) {
    final languageProvider = LanguageProvider.read(context);
    final currentLanguage = languageProvider?.languageNotifier.currentLocale;
    languageProvider?.setLocale(Locale(currentLanguage?.languageCode == "en" ? 'uk' : 'en'));
  }
}
