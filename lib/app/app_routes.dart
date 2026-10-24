/// A named route: [name] for `goNamed`, [path] relative to its parent.
class AppRoute {
  const AppRoute({required this.name, required this.path});

  final String name;
  final String path;
}

/// Every route of the app. Paths keep the original URLs (`/portfolio`) so
/// links shared before the redesign still open.
abstract final class AppRoutes {
  static const home = AppRoute(name: 'home', path: '/');
  static const projects = AppRoute(name: 'projects', path: '/portfolio');
  static const project = AppRoute(name: 'project', path: ':$projectIdParam');
  static const contacts = AppRoute(name: 'contacts', path: '/contacts');
  static const useful = AppRoute(name: 'useful', path: '/useful');

  static const String projectIdParam = 'projectId';
}
