import 'package:flutter/material.dart';
import 'package:my_portfolio/presenter/ui/menu/general_menu_bar.dart';

import 'navigation/host_navigator.dart';
import 'navigation/host_routes.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: Navigator(
              key: HomeNavigator.navKey,
              initialRoute: HomeRoutes.root,
              onGenerateRoute: HomeNavigator.getProfileRoutes,
            ))
          ],
        ),
        GeneralMenuBar(
          onHome: () {
            HomeNavigator.navKey.currentState
                ?.pushReplacementNamed(HomeRoutes.root);
          },
          onContact: () {
            HomeNavigator.navKey.currentState
                ?.pushReplacementNamed(HomeRoutes.contact);
          },
          onPortfolio: () {
            HomeNavigator.navKey.currentState
                ?.pushReplacementNamed(HomeRoutes.portfolio);
          },
        ),
      ]),
    );
  }
}
