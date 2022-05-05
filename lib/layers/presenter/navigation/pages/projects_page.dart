import 'package:flutter/material.dart';
import '../../pages/host/host_page.dart';
import '../../pages/host/host_routes.dart';
import '../common/pages/base_page.dart';

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
