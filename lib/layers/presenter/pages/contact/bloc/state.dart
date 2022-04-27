import 'package:my_portfolio/layers/domain/entity/model/contact/contacts_model.dart';


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
