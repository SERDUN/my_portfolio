import 'package:flutter/material.dart';
import 'package:my_portfolio/presenter/pages/contact/contact_page.dart';
import 'package:my_portfolio/presenter/pages/home/home_page.dart';

import 'fade_move_rout.dart';
import 'host_routes.dart';

abstract class HomeNavigator {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Map<String, Widget> searchRoutes = {
    HomeRoutes.root: const HomePage(),
    HomeRoutes.contact: ContactPage(),
    HomeRoutes.filled: Container(
      color: Colors.red,
    ),
    HomeRoutes.categories: Container(
      color: Colors.red,
    ),
    HomeRoutes.occasions: Container(
      color: Colors.red,
    ),
    HomeRoutes.productsByOccasion: Container(
      color: Colors.red,
    ),
    HomeRoutes.trending: Container(
      color: Colors.red,
    )
  };

  static Route<BuildContext>? getProfileRoutes(RouteSettings settings) {
    final Widget? child = searchRoutes[settings.name];
    if (child != null) {
      return FadeMovePageRout(
        settings: settings,
        builder: (context) {
          // if (settings.name != HomeRoutes.root) {
          //   return Stack(
          //     children: [
          //       Container(
          //         // decoration: BoxDecoration(
          //         //     gradient: LinearGradient(
          //         //         begin: Alignment.topCenter,
          //         //         end: Alignment.bottomCenter,
          //         //         stops: const [
          //         //       0,
          //         //       0.35,
          //         //       0.65
          //         //     ],
          //         //         colors: [
          //         //       Colors.white.withOpacity(0),
          //         //       Colors.white.withOpacity(0),
          //         //       Colors.white
          //         //     ])),
          //       ),
          //       child
          //     ],
          //   );
          // } else {
            return child;
          //}
        },
      );
    }
    return null;
  }
}
