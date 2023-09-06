part of 'projects_cubit.dart';

enum ProjectsStatus {
  initial,
  loading,
  error,
  success,
}

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState({
    @Default(ProjectsStatus.initial) ProjectsStatus status,
    @Default([]) final List<ProjectModel> projects,
  }) = _ProjectsState;
}
