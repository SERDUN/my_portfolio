import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';

import 'app_routes.dart';

/// Typed navigation, so features and shared widgets never spell route names
/// or paths themselves.
extension AppNavigation on BuildContext {
  void openProject(String id) => goNamed(AppRoutes.project.name, pathParameters: {AppRoutes.projectIdParam: id});

  void openProjects() => goNamed(AppRoutes.projects.name);

  void openContacts() => goNamed(AppRoutes.contacts.name);

  void openUseful() => goNamed(AppRoutes.useful.name);

  void openHome() => goNamed(AppRoutes.home.name);
}
