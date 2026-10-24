import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';

part 'shell_state.dart';

part 'shell_cubit.freezed.dart';

/// The owner (name, CV link) for the header and the mobile menu. Optional
/// decoration: both have fallbacks, so a failure is only logged.
class ShellCubit extends Cubit<ShellState> with CubitSubscriptions<ShellState>, LanguageReload<ShellState> {
  ShellCubit(this.userUseCase, LanguageSource languages) : super(const ShellState()) {
    reloadOn(languages);
  }

  final GetUserUseCase userUseCase;

  @override
  void load() => subscribe(
    #user,
    userUseCase.execute(language: language),
    onData: (user) => emit(state.copyWith(user: user)),
  );
}
