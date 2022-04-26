import 'package:flutter/material.dart';

import '../../pages/home/host/host_page.dart';
import '../../pages/home/host/host_routes.dart';
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
