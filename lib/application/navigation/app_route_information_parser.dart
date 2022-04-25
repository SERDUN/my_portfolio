import 'package:flutter/material.dart';
import 'app_router_configuration.dart';

class AppRouteInformationParser
    extends RouteInformationParser<AppRouterConfiguration> {
  @override
  Future<AppRouterConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final String path = routeInformation.location ?? '';
    AppRouterConfiguration config = AppRouterConfiguration(location: path);
    return config;
  }

  @override
  RouteInformation? restoreRouteInformation(
      AppRouterConfiguration configuration) {
    return RouteInformation(location: configuration.path.toString());

  }
}
