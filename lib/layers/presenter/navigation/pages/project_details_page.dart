import 'package:flutter/material.dart';

import '../../pages/portfolio/details/project_details_page.dart';
import '../common/pages/base_page.dart';

class ProjectPage extends BasePage {
  const ProjectPage(Map<String, dynamic> args)
      : super(
            key: const ValueKey('ProjectDetailsPage'),
            name: "/projects",
            args: args);

  @override
  Widget root() => ProjectDetailsPage(
        id: args["id"],
      );
}
