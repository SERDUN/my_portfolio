import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';

part 'shell_state.dart';

part 'shell_cubit.freezed.dart';

/// Data the shell itself needs on every page: the owner (name, CV link) for
/// the header and the contacts for the footer. Both are decoration: a
/// failure is logged and the header and footer keep their fallbacks.
class ShellCubit extends Cubit<ShellState> with CubitSubscriptions<ShellState>, LanguageReload<ShellState> {
  ShellCubit(this.userUseCase, this.contactsUseCase, LanguageSource languages) : super(const ShellState()) {
    reloadOn(languages);
  }

  final GetUserUseCase userUseCase;
  final GetContactsUseCase contactsUseCase;

  @override
  void load() {
    subscribe(
      #user,
      userUseCase.execute(language: language),
      onData: (user) => emit(state.copyWith(user: user)),
    );
    subscribe(
      #contacts,
      contactsUseCase.execute(language: language),
      onData: (contacts) => emit(state.copyWith(contacts: contacts)),
    );
  }
}
