import '../common/common.dart';
import '../entity/model/model.dart';

/// The portfolio projects.
abstract class ProjectRepository {
  /// All projects in [language], in display order.
  Stream<List<ProjectModel>> getProjects(Language language);

  /// One project by [id]; errors with [ProjectNotFoundException] when there
  /// is none.
  Stream<ProjectModel> getProjectById(String id, Language language);
}
