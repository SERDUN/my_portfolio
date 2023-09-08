import '../entity/dto/project_dto.dart';

abstract class ProjectRepository {
  Stream<List<ProjectDTO>> getProjects(String localization);

  Stream<ProjectDTO> getProjectById(String id, String localization);
}
