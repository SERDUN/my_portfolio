import 'package:domain/domain.dart';

class ContactsState {
  final List<ContactsModel>? contacts;

  ContactsState(this.contacts);

  ContactsState init() {
    return ContactsState(null);
  }

  ContactsState fill(List<ContactsModel>? projectModel) {
    return ContactsState(projectModel);
  }
}
