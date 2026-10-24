import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';
import 'package:my_portfolio/localization/localization.dart';

part 'contacts_state.dart';

part 'contacts_cubit.freezed.dart';

/// Contact channels for the contacts page.
class ContactsCubit extends Cubit<ContactsState> with CubitSubscriptions<ContactsState>, LanguageReload<ContactsState> {
  ContactsCubit(this.useCase, this.languageNotifier) : super(const ContactsState()) {
    reloadOn(languageNotifier);
  }

  final LanguageNotifier languageNotifier;

  final GetContactsUseCase useCase;

  @override
  void load() => loadPrimary(
        #contacts,
        useCase.execute(language: languageNotifier.language),
        loading: state.copyWith(status: LoadStatus.loading, error: null),
        success: (contacts) => state.copyWith(status: LoadStatus.success, contacts: contacts),
        failure: (error) => state.copyWith(status: LoadStatus.failure, error: error),
      );
}
