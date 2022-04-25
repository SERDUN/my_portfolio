import 'package:flutter/widgets.dart';
import 'package:my_portfolio/application/navigation/pages/base_page.dart';
import 'package:my_portfolio/application/navigation/pages/home_page.dart';
import 'package:my_portfolio/application/navigation/pages/project_details_page.dart';
import 'package:my_portfolio/application/navigation/pages/unknown_page.dart';

class AppRouterConfiguration {
  ///full path to the page
  late final Uri path;

  ///to make it easier to use the path with different interfaces
  late final String route;

  ///an identifier for the page (optional)
  final String? name;

  ///page args: can be added in the path as a string literal, or manually when creating the route
  final Map<String, dynamic> args = {};

  ///Our route description, this is where actual builds happen
  late final Page page;

  AppRouterConfiguration({
    required String location,
    Map<String, dynamic>? args,
    this.name,
  }) {
    path = location.isNotEmpty ? Uri.parse(location) : Uri.parse('/');
    route = path.toString();
    this.args.addIfNotNull(args);

    ///get the page from defined pages
    page = getPage(this);
  }

  @override
  String toString() {
    return 'PageConfig: path = $path, args = $args';
  }

  @override
  List<Object?> get props => [path, args];
}

Page getPage(AppRouterConfiguration config) {
  Page p = _routes[config.route]?.call(config.args) ?? const UnknownPage();
  return p;
}

Map<String, BasePage Function(Map<String, dynamic>)> _routes = {
  '/': (args) => HomePage(args),
  '/project': (args) => ProjectPage(args),
};

extension AddNullableMap on Map {
  void addIfNotNull(Map? other) {
    if (other != null) {
      addAll(other);
    }
  }
}
