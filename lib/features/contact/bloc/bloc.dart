import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'event.dart';
import 'state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final GetContactsUseCase useCase;

  ContactsBloc(this.useCase) : super(ContactsState(null).init()) {
    on<InitContactsEvent>(_init);
    add(InitContactsEvent());
  }

  void _init(InitContactsEvent event, Emitter<ContactsState> emit) async {
    var contacts = await useCase.execute();
    emit(state.fill(contacts));
  }
}
