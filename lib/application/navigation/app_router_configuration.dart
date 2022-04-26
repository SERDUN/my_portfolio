import 'package:flutter/widgets.dart';
import 'package:my_portfolio/application/navigation/pages/base_page.dart';
import 'package:my_portfolio/application/navigation/pages/contact_page.dart';
import 'package:my_portfolio/application/navigation/pages/home_page.dart';
import 'package:my_portfolio/application/navigation/pages/project_details_page.dart';
import 'package:my_portfolio/application/navigation/pages/projects_page.dart';
import 'package:my_portfolio/application/navigation/pages/unknown_page.dart';
import 'package:my_portfolio/layers/presenter/pages/host_page/navigation/host_routes.dart';

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

     getPage(path);
  }

  void getPage(Uri uri) {
    switch (uri.path) {
      case "/":
        {
          page = HomePage(args);
          break;
        }
      case "/intro":
        {
          page = HomePage(args);
          break;
        }
      case "/projects":
        {
          String param = uri.queryParametersAll['id']?.first ?? "";
          int? id = int.tryParse(param);
          if (id == null) {
            page = ProjectsPage(args);
          } else {
            page = ProjectPage({"id": id});
          }

          break;
        }
      case "/contact":
        {
          page = ContactPage(args);
          break;
        }

      default:
        {
          page = UnknownPage();
        }
    }
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
