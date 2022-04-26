abstract class ProjectDetailsEvent {}

class InitEvent extends ProjectDetailsEvent {}

class GetProjectEvent extends ProjectDetailsEvent {
  final int projectId;

  GetProjectEvent(this.projectId);
}
