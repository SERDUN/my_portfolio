part of 'bio_cubit.dart';

enum BioStatus { initial, loading, error, success }

@freezed
abstract class BioState with _$BioState {
  const factory BioState({
    @Default(BioStatus.initial) BioStatus status,
    PortfolioUserModel? user,
    List<PortfolioSkillsModel>? skills,
  }) = _BioState;
}
