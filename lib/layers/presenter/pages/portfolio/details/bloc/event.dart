abstract class ProjectDetailsEvent {}

class InitEvent extends ProjectDetailsEvent {}

class GetProjectEvent extends ProjectDetailsEvent {
  final int projectId;
  final String? locale;

  GetProjectEvent(this.projectId, this.locale);
}
