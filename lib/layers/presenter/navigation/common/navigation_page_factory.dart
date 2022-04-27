

import 'package:my_portfolio/layers/presenter/navigation/common/pages/base_page.dart';
import 'package:my_portfolio/layers/presenter/navigation/pages/home_page.dart';
import 'package:my_portfolio/layers/presenter/navigation/pages/unknown_page.dart';

import '../pages/contact_page.dart';
import '../pages/project_details_page.dart';
import '../pages/projects_page.dart';

class PageFactoryData {
  final BasePage page;
  final Uri uri;
  final String path;
  final Map<String, dynamic> argument;

  PageFactoryData(this.page, this.argument, this.uri, this.path);
}

class PageFactory {
  final String path;

  PageFactory(this.path);

  PageFactoryData build() {
    Uri uri = path.isNotEmpty ? Uri.parse(path) : Uri.parse('/');
    List<String> segments = uri.pathSegments;
    BasePage basePage = _getPage(segments);
    return PageFactoryData(basePage, basePage.args, uri, uri.path);
  }

  BasePage _getPage(List<String> segments) {
    String rootPath = segments.isEmpty ? "" : segments.elementAt(0);
    switch (rootPath) {
      case "":
        return const HomePage({});
      case "home":
        return const HomePage({});
      case "projects":
        return _getProjectPage(segments);
      case "contact":
        return const ContactPage({});
      default:
        return const UnknownPage();
    }
  }

  //Finding projects page
  BasePage _getProjectPage(List<String> segments) {
    switch (segments.length) {
      case 1:
        return const ProjectsPage({});
      case 2:
        return ProjectPage({"id": int.tryParse(segments[1])});
      case 3:
      default:
        return const UnknownPage();
    }
  }
}
