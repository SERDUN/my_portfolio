import 'package:flutter/material.dart';

import 'navigation_router_configuration.dart';

class NavigationRouteInformationParser
    extends RouteInformationParser<NavigationRouterConfiguration> {
  @override
  Future<NavigationRouterConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final String path = routeInformation.location ?? '';
    NavigationRouterConfiguration config = NavigationRouterConfiguration(location: path);

    return config;
  }

  @override
  RouteInformation? restoreRouteInformation(
      NavigationRouterConfiguration configuration) {
    return RouteInformation(location: configuration.path.toString());
  }
}
