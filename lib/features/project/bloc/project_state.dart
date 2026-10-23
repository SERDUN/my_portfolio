part of 'project_cubit.dart';

enum ProjectStatus {
  initial,
  loading,
  error,
  success,
}

@freezed
abstract class ProjectState with _$ProjectState {
  const factory ProjectState({
    @Default(ProjectStatus.initial) ProjectStatus status,
    ProjectModel? project,
  }) = _ProjectState;
}
