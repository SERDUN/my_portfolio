import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'contacts_state.dart';

part 'contacts_cubit.freezed.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit(this.useCase) : super(const ContactsState(status: ContactsStatus.initial));

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
  }
}
