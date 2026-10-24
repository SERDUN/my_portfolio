part of 'bio_cubit.dart';

enum BioStatus { initial, loading, error, success }

@freezed
abstract class BioState with _$BioState {
  const BioState._();

  const factory BioState({
    @Default(BioStatus.initial) BioStatus status,
    PortfolioUserModel? user,
    List<PortfolioSkillsModel>? skills,
    @Default([]) List<ProjectModel> projects,
  }) = _BioState;

  /// Projects flagged in the data, falling back to the first three with a
  /// preview image so the block is never empty.
  List<ProjectModel> get featuredProjects {
    final flagged = projects.where((p) => p.featured).toList();
    if (flagged.isNotEmpty) return flagged;
    return projects.where((p) => p.preview != null && p.preview!.isNotEmpty).take(3).toList();
  }

  /// Distinct platforms across all projects: Flutter, Android, ...
  int get platformCount => projects.map((p) => p.platform).whereType<String>().toSet().length;
}
