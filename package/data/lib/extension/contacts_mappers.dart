import 'package:domain/domain.dart';

import '../dto/contacts_dto.dart';

extension ContactsDtoMapper on ContactsDTO {
  ContactsModel toDomain() => ContactsModel(title: title, value: value);
}

extension ContactsDtoListMapper on List<ContactsDTO> {
  List<ContactsModel> toDomain() => map((dto) => dto.toDomain()).toList();
}
