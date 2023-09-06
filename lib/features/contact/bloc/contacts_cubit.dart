import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'contacts_state.dart';

part 'contacts_cubit.freezed.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit(this.useCase) : super(const ContactsState(status: ContactsStatus.initial));

  final GetContactsUseCase useCase;

  void getContacts() async {
    var contacts = await useCase.execute();
    emit(state.copyWith(contacts: contacts));
  }
}
