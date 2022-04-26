import 'package:flutter/widgets.dart';

import 'navigation_page_factory.dart';

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
    Map<String, dynamic>? argument,
    this.name,
  }) {
    var data = PageFactory(location).build();
    path = data.uri;
    route = data.path;
    page = data.page;
    args.addIfNotNull(data.argument);
    args.addIfNotNull(argument);
  }

  @override
  String toString() {
    return 'PageConfig: path = $path,route = $route, args = $args';
  }

  @override
  List<Object?> get props => [path, args];
}

extension AddNullableMap on Map {
  void addIfNotNull(Map? other) {
    if (other != null) {
      addAll(other);
    }
  }
}
