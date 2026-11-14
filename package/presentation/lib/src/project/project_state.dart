part of 'project_cubit.dart';

@freezed
abstract class ProjectState with _$ProjectState {
  const ProjectState._();

  const factory ProjectState({
    @Default(LoadStatus.initial) LoadStatus status,
    ProjectModel? project,
    @Default([]) List<ProjectModel> projects,
    Object? error,
  }) = _ProjectState;

  bool get isNotFound => status == LoadStatus.failure && error is ProjectNotFoundException;

  /// The project after the current one in the list, wrapping around; null
  /// while the list is unknown or holds only this project.
  ProjectModel? get nextProject {
    final current = project;
    if (current == null || projects.length < 2) return null;
    final index = projects.indexWhere((p) => p.id == current.id);
    if (index < 0) return projects.first;
    return projects[(index + 1) % projects.length];
  }
}
