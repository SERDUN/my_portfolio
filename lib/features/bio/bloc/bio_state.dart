part of 'bio_cubit.dart';

@freezed
abstract class BioState with _$BioState {
  const BioState._();

  const factory BioState({
    @Default(LoadStatus.initial) LoadStatus status,
    PortfolioUserModel? user,
    List<PortfolioSkillsModel>? skills,
    @Default([]) List<ProjectModel> projects,
    Object? error,
  }) = _BioState;

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
