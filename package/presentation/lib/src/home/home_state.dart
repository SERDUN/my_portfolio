part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default(LoadStatus.initial) LoadStatus status,
    PortfolioUserModel? user,
    List<SkillGroupModel>? skills,
    @Default([]) List<ProjectModel> projects,
    Object? error,
  }) = _HomeState;

  /// Projects flagged in the data, falling back to the first three with a
  /// preview image so the block is never empty.
  List<ProjectModel> get featuredProjects {
    final flagged = projects.where((p) => p.featured).toList();
    if (flagged.isNotEmpty) return flagged;
    return projects.where((p) => p.preview != null).take(3).toList();
  }

  /// Distinct platforms across all projects: Flutter, Android, ...
  int get platformCount => projects.map((p) => p.platform).whereType<ProjectPlatform>().toSet().length;
}
