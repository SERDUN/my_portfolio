abstract class ContactsEvent {}

class InitContactsEvent extends ContactsEvent {}

class GetContactsEvent extends ContactsEvent {

  GetContactsEvent();
}
