import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/localization/localization.dart';

part 'shell_state.dart';

part 'shell_cubit.freezed.dart';

/// Data the shell itself needs on every page: the owner (name, CV link) for
/// the header and the contacts for the footer. Re-reads on language change.
class ShellCubit extends Cubit<ShellState> {
  ShellCubit(
    this.userUseCase,
    this.contactsUseCase,
    this.languageNotifier,
  ) : super(const ShellState()) {
    _load();
    languageNotifier.addListener(_load);
  }

  final GetUserUseCase userUseCase;
  final GetContactsUseCase contactsUseCase;
  final LanguageNotifier languageNotifier;

  StreamSubscription<PortfolioUserModel>? _userSubscription;
  StreamSubscription<List<ContactsModel>>? _contactsSubscription;

  void _load() {
    final language = languageNotifier.language;
    _userSubscription?.cancel();
    _userSubscription = userUseCase.execute(language: language).listen((user) {
      if (!isClosed) emit(state.copyWith(user: user));
    });
    _contactsSubscription?.cancel();
    _contactsSubscription = contactsUseCase.execute(language: language).listen((contacts) {
      if (!isClosed) emit(state.copyWith(contacts: contacts));
    });
  }

  @override
  Future<void> close() async {
    languageNotifier.removeListener(_load);
    await _userSubscription?.cancel();
    await _contactsSubscription?.cancel();
    return super.close();
  }
}
