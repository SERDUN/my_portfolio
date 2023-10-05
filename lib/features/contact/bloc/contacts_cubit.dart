import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/localization/localization.dart';

part 'contacts_state.dart';

part 'contacts_cubit.freezed.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit(
    this.useCase,
    this.languageNotifier,
  ) : super(const ContactsState(status: ContactsStatus.initial)) {
    _initState();
    languageNotifier.addListener(_initState);
  }

  void _initState() {
    getContacts();
  }

  final LanguageNotifier languageNotifier;

  final GetContactsUseCase useCase;

  StreamSubscription? _contactsStreamSubscription;

  void getContacts() async {
    _contactsStreamSubscription?.cancel();
    _contactsStreamSubscription = null;
    _contactsStreamSubscription = useCase.execute().listen((event) {
      emit(state.copyWith(status: ContactsStatus.success, contacts: event));
    });
  }

  @override
  Future<void> close() async {
    await super.close();
    _contactsStreamSubscription?.cancel();
    languageNotifier.removeListener(_initState);
  }
}
