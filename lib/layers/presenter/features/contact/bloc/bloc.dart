import 'package:bloc/bloc.dart';
import 'package:my_portfolio/layers/domain/usecase/contacts/get_contacts_use_case.dart';

import 'event.dart';
import 'state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final GetContactsUseCase useCase;

  ContactsBloc(this.useCase) : super(ContactsState(null).init()) {
    on<InitContactsEvent>(_init);
  }

  void _init(InitContactsEvent event, Emitter<ContactsState> emit) async {
    var contacts = await useCase.execute();
    if (contacts.isRight) {
      emit(state.fill(contacts.right));
    }
  }
}
