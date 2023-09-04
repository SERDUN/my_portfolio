import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

import '../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(context?.locale?.languageCode),
      appBar: AppBar(
        toolbarHeight: kMinInteractiveDimension,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        title: const Text("Dmitro Serdun"),
        leading: SwitcherLanguage(
          localizationChanged: () => CallbackInheritedWidget.of(context)?.callback(),
        ),
        actions: [
          ActionTab(
            isSelected: navigationShell.currentIndex == 0,
            onTab: () => navigationShell.goBranch(0),
            title: "Bio",
          ),
          ActionTab(
            isSelected: navigationShell.currentIndex == 1,
            onTab: () => navigationShell.goBranch(1),
            title: "Portfolio",
          ),
          ActionTab(
            isSelected: navigationShell.currentIndex == 2,
            onTab: () => navigationShell.goBranch(2),
            title: "Contacts",
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
      body: navigationShell,
    );
  }
}
