import '../entity/model/model.dart';

/// The portfolio projects.
abstract class ProjectRepository {
  /// All projects in [localization], in display order.
  Stream<List<ProjectModel>> getProjects(String localization);

  /// One project by [id]; errors when there is none.
  Stream<ProjectModel> getProjectById(String id, String localization);
}
