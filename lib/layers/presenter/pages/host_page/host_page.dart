import 'package:flutter/material.dart';

import '../../common/widgets/bars/common_app_bar.dart';
import 'navigation/host_navigator.dart';
import 'navigation/host_routes.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HostPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
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
      backgroundColor: Colors.white54,
      body: Navigator(
        key: HomeNavigator.navKey,
        initialRoute: HomeRoutes.root,
        onGenerateRoute: HomeNavigator.getProfileRoutes,

      ),
    );
  }
}
