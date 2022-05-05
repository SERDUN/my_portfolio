abstract class ProjectsEvent {}

class InitProjectsEvent extends ProjectsEvent {
  final String? locale;

  InitProjectsEvent(this.locale);
}
