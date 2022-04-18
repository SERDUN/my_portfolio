import 'package:flutter/material.dart';
import '../../contact/contact_page.dart';
import '../../home/home_page.dart';
import '../../portfollio/projects/portfolio_page.dart';
import 'fade_move_rout.dart';
import 'host_routes.dart';

abstract class HomeNavigator {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Map<String, Widget> searchRoutes = {
    HomeRoutes.root: const HomePage(),
    HomeRoutes.contact: const ContactPage(),
    HomeRoutes.portfolio: const PortfolioPage(),
  };



  static Route<T> slideThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 300}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );

      },
    );
  }

  static Route<BuildContext>? getProfileRoutes(RouteSettings settings) {
    final Widget? child = searchRoutes[settings.name];
    if (child != null) {
      return FadeMovePageRout(
        settings: settings,
        builder: (context) {
          if (settings.name != HomeRoutes.root) {
            return child;
          } else {
          return child;
          }
        },
      );
    }
    return null;
   }
}