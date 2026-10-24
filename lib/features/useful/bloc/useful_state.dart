part of 'useful_cubit.dart';

@freezed
abstract class UsefulState with _$UsefulState {
  const factory UsefulState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default([]) List<CommandGroupModel> groups,
    Object? error,
  }) = _UsefulState;
}
