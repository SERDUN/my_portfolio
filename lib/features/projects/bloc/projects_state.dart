part of 'projects_cubit.dart';

enum ProjectsStatus {
  initial,
  loading,
  error,
  success,
}

@freezed
abstract class ProjectsState with _$ProjectsState {
  const factory ProjectsState({
    @Default(ProjectsStatus.initial) ProjectsStatus status,
    @Default([]) List<ProjectModel> projects,
  }) = _ProjectsState;
}
