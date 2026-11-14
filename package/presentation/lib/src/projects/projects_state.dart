part of 'projects_cubit.dart';

@freezed
abstract class ProjectsState with _$ProjectsState {
  const factory ProjectsState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default([]) List<ProjectModel> projects,
    Object? error,
  }) = _ProjectsState;
}
