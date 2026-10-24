/// The framework a project is built with; what the platform tag and the
/// project filter show.
enum ProjectPlatform { flutter, android }

/// Where a project can be seen. A missing link is null, never an empty
/// string, so "has a link" is one null check.
class ProjectLinks {
  const ProjectLinks({this.googlePlay, this.appStore, this.github});

  final Uri? googlePlay;
  final Uri? appStore;
  final Uri? github;

  bool get hasStore => googlePlay != null || appStore != null;
  bool get isEmpty => !hasStore && github == null;
}

/// One portfolio project. [id] and [name] always exist: the data layer
/// rejects a project without them instead of passing nulls to every screen.
class ProjectModel {
  ProjectModel({
    required this.id,
    required this.name,
    this.intro = '',
    this.description = '',
    this.platform,
    this.links = const ProjectLinks(),
    this.spheres = const [],
    this.technologies = const [],
    this.screenshots = const [],
    this.preview,
    this.featured = false,
  });

  final String id;
  final String name;

  /// One line for cards; may be empty.
  final String intro;

  /// The long text of the project page; may be empty.
  final String description;

  final ProjectPlatform? platform;
  final ProjectLinks links;
  final List<String> spheres;

  /// The full stack as written in the data, platform name included.
  final List<String> technologies;

  final List<Uri> screenshots;

  /// The screenshot shown on cards and in the project hero.
  final Uri? preview;

  /// Picked for the "selected work" block on the home page.
  final bool featured;

  /// The stack without the platform name, which the tag already shows.
  List<String> get stack =>
      platform == null ? technologies : technologies.where((t) => t.toLowerCase() != platform!.name).toList();

  /// The intro for a card, falling back to the description.
  String get summary => intro.isNotEmpty ? intro : description;
}
