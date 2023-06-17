import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../models/host_routes.dart';
import '../widgets/common_app_bar.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        defaultPage: HomeRoutes.values[navigationShell.currentIndex],
        onHome: () => navigationShell.goBranch(0),
        onPortfolio: () => navigationShell.goBranch(1),
        onContact: () => navigationShell.goBranch(2),
      ),
      backgroundColor: Colors.white54,
      body: navigationShell,
    );
  }
}
