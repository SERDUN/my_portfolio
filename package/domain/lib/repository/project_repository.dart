import '../entity/dto/project_dto.dart';

abstract class ProjectRepository {
  Future<List<ProjectDTO>> getProjects(String localization);

  Future< ProjectDTO> getProjectById(String id, String localization);
}
