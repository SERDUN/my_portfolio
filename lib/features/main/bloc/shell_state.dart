part of 'shell_cubit.dart';

@freezed
abstract class ShellState with _$ShellState {
  const factory ShellState({PortfolioUserModel? user}) = _ShellState;
}
