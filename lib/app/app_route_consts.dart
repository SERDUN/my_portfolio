class RouteData {
  final String name;
  final String path;

  const RouteData({
    required this.name,
    required this.path,
  });
}

abstract class AppRoutInfo {
  static const resume = RouteData(
    name: 'resume',
    path: '/',
  );
  static const portfolio = RouteData(
    name: 'portfolio',
    path: '/portfolio',
  );
  static const applicationCreate = RouteData(
    name: 'contacts',
    path: '/contacts',
  );
  static const project = RouteData(
    name: 'portfolio/project',
    path: ':$projectId',
  );

  static const contacts = RouteData(
    name: 'contacts',
    path: '/contacts',
  );
  static const useful = RouteData(
    name: 'useful',
    path: '/useful',
  );

  static const String projectId = 'projectId';
  static const String keyThemeId = 'themeId';
}
