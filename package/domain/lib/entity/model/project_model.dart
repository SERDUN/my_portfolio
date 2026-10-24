class ProjectModel {
  ProjectModel({
    this.name,
    this.intro,
    this.description,
    this.spheres = const [],
    this.technologies = const [],
    required this.linkAndroid,
    required this.linkIOS,
    required this.linkGithub,
    this.screenshots = const [],
    this.preview,
    this.id,
    this.featured = false,
  });

  final String? id;
  final String? name;
  final String? intro;
  final String? description;
  final String linkAndroid;
  final String linkIOS;
  final String linkGithub;
  final List<String> spheres;
  final List<String> technologies;
  final List<String> screenshots;
  final String? preview;

  /// Picked for the "selected work" block on the home page.
  final bool featured;

  /// "Flutter" or "Android" when the stack names one, else the first
  /// technology. Used as the platform tag on cards.
  String? get platform {
    for (final tech in technologies) {
      final lower = tech.toLowerCase();
      if (lower == 'flutter') return 'Flutter';
      if (lower == 'android') return 'Android';
    }
    return technologies.isEmpty ? null : technologies.first;
  }

  bool get hasStoreLink => linkAndroid.isNotEmpty || linkIOS.isNotEmpty;
}
