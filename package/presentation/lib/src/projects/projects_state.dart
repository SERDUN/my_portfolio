part of 'projects_cubit.dart';

@freezed
abstract class ProjectsState with _$ProjectsState {
  const ProjectsState._();

  const factory ProjectsState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default([]) List<ProjectModel> projects,
    Object? error,
  }) = _ProjectsState;

  /// Platform -> number of projects, in order of first appearance: the
  /// filter of the projects page.
  Map<ProjectPlatform, int> get platformCounts {
    final counts = <ProjectPlatform, int>{};
    for (final project in projects) {
      final platform = project.platform;
      if (platform != null) counts[platform] = (counts[platform] ?? 0) + 1;
    }
    return counts;
  }
}
