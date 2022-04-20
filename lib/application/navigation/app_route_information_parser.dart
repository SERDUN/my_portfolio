import 'package:flutter/material.dart';
import 'app_router_configuration.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRouterConfiguration> {
  @override
  Future<AppRouterConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 0) {
      return AppRouterConfiguration.home();
    } else if (uri.pathSegments.length == 1) {
      final first = uri.pathSegments[0].toLowerCase();
      if (first == 'home') {
        return AppRouterConfiguration.home();
      } else if (first == 'login') {
        return AppRouterConfiguration.login();
      } else {
        return AppRouterConfiguration.unknown();
      }
    } else if (uri.pathSegments.length == 2) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      if (first == 'colors' && second.length == 6) {
        return AppRouterConfiguration.color(second);
      } else {
        return AppRouterConfiguration.unknown();
      }
    } else if (uri.pathSegments.length == 3) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      final third = uri.pathSegments[2].toLowerCase();
      return AppRouterConfiguration.unknown();

      // if (first == 'colors' &&
      //     second.length == 6 &&
      //     second.isHexColor() &&
      //     shapeBorderType != null) {
      //   return AppRouterConfiguration.shapeBorder(second, shapeBorderType);
      // } else {
      //   return MyAppConfiguration.unknown();
      // }
    } else {
      return AppRouterConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppRouterConfiguration configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(location: '/unknown');
    } else if (configuration.isSplashPage) {
      return null;
    } else if (configuration.isLoginPage) {
      return RouteInformation(location: '/login');
    } else if (configuration.isHomePage) {
      return RouteInformation(location: '/');
    } else if (configuration.isColorPage) {
      return RouteInformation(location: '/colors/${configuration.colorCode}');
    }else {
      return null;
    }
  }

}
