
import '../../../../../../../domain/entity/model/projects/project_model.dart';

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
