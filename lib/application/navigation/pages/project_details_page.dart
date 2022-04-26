import 'package:flutter/material.dart';
import '../../../layers/presenter/pages/host_page/host_page.dart';
import '../../../layers/presenter/pages/portfollio/details/project_details_page.dart';
import 'base_page.dart';

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
