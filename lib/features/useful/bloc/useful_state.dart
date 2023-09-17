part of 'useful_cubit.dart';

enum UsefulStatus {
  initial,
  loading,
  error,
  success,
}

@freezed
class UsefulState with _$UsefulState {
  const factory UsefulState({
    @Default(UsefulStatus.initial) UsefulStatus status,
    @Default([]) final List<UsefulCommandsModel> usefulCommands,
  }) = _UsefulState;
}
