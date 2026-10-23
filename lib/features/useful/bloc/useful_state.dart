part of 'useful_cubit.dart';

enum UsefulStatus {
  initial,
  loading,
  error,
  success,
}

@freezed
abstract class UsefulState with _$UsefulState {
  const factory UsefulState({
    @Default(UsefulStatus.initial) UsefulStatus status,
    @Default([]) List<UsefulCommandsModel> usefulCommands,
  }) = _UsefulState;
}
