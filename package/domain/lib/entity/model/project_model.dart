class ProjectModel {
  final String? id;
  final String? name;
  final String? intro;
  final String? description;
  final String linkAndroid;
  final String linkIOS;
  final String linkSource;
  final List<String> spheres;
  final List<String> technologies;
  final List<String> screenshots;
  final String? preview;

  ProjectModel({
    this.name,
    this.intro,
    this.description,
    this.spheres = const [],
    this.technologies = const [],
    required this.linkAndroid,
    required this.linkIOS,
    required this.linkSource,
    this.screenshots = const [],
    this.preview,
    this.id,
  });
}
