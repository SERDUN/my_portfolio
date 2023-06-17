import 'package:domain/domain.dart';

class ProjectDetailsState {
  final ProjectModel? projects;

  ProjectDetailsState(this.projects);

  ProjectDetailsState init() {
    return ProjectDetailsState(null);
  }

  ProjectDetailsState fill(ProjectModel projectModel) {
    return ProjectDetailsState(projectModel);
  }
}
