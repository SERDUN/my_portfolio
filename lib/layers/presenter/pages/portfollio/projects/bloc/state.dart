import '../../../../../domain/entity/model/projects/project_model.dart';

class ProjectsState {
  final List<ProjectModel> projects;

  ProjectsState(this.projects);

  ProjectsState init() {
    return ProjectsState([]);
  }

  ProjectsState clone() {
    return ProjectsState(projects);
  }

  ProjectsState fill(List<ProjectModel> projects) {
    return ProjectsState(projects);
  }
}
