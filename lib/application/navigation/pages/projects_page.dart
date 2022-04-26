import 'package:flutter/material.dart';
import '../../../layers/presenter/pages/host_page/host_page.dart';
import '../../../layers/presenter/pages/host_page/navigation/host_routes.dart';
import 'base_page.dart';

class ProjectsPage extends BasePage {
  const ProjectsPage(Map<String, dynamic> args)
      : super(
            key: const ValueKey('ProjectsPage'),
            name: ("/projects"),
            args: args);

  @override
  Widget root() => const HostPage(
        defaultPage: HomeRoutes.projects,
      );
}
