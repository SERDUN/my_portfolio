import 'package:domain/domain.dart';

/// A platform a project is published on, as the project page lists it.
enum PublishedPlatform { ios, android, web }

/// Where [project] can be used: iOS for an App Store link, Android for a
/// Google Play link, the web when its technologies name it. Empty when none
/// applies; the page then shows the platform tag instead.
List<PublishedPlatform> publishedPlatforms(ProjectModel project) => [
  if (project.links.appStore != null) PublishedPlatform.ios,
  if (project.links.googlePlay != null) PublishedPlatform.android,
  if (project.technologies.any((t) => t.toLowerCase() == 'web')) PublishedPlatform.web,
];
