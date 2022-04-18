import '../../../../../domain/entity/model/projects/project_model.dart';

class ProjectsState {
  final List<ProjectModel> projects;

  ProjectsState({this.projects=const []});

  ProjectsState init() {
    return ProjectsState();
  }

  ProjectsState clone() {
    return ProjectsState();
  }

  ProjectsState fill(List<ProjectModel> projects) {
    return ProjectsState(projects: projects);
  }
}
