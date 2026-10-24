import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';
import 'package:my_portfolio/localization/localization.dart';

part 'shell_state.dart';

part 'shell_cubit.freezed.dart';

/// Data the shell itself needs on every page: the owner (name, CV link) for
/// the header and the contacts for the footer. Both are decoration: a
/// failure is logged and the header and footer keep their fallbacks.
class ShellCubit extends Cubit<ShellState> with CubitSubscriptions<ShellState>, LanguageReload<ShellState> {
  ShellCubit(
    this.userUseCase,
    this.contactsUseCase,
    this.languageNotifier,
  ) : super(const ShellState()) {
    reloadOn(languageNotifier);
  }

  final GetUserUseCase userUseCase;
  final GetContactsUseCase contactsUseCase;
  final LanguageNotifier languageNotifier;

  @override
  void load() {
    final language = languageNotifier.language;
    subscribe(#user, userUseCase.execute(language: language), onData: (user) => emit(state.copyWith(user: user)));
    subscribe(
      #contacts,
      contactsUseCase.execute(language: language),
      onData: (contacts) => emit(state.copyWith(contacts: contacts)),
    );
  }
}
