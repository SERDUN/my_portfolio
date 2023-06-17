import 'package:domain/domain.dart';

class ContactsState {
  final ContactsModel? contacts;

  ContactsState(this.contacts);

  ContactsState init() {
    return ContactsState(null);
  }

  ContactsState fill(ContactsModel projectModel) {
    return ContactsState(projectModel);
  }
}
