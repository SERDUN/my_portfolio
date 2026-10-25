import 'package:domain/domain.dart';

import '../dto/dto.dart';

extension ContactDtoMapper on ContactDTO {
  ContactModel toDomain() => ContactModel(title: title, value: value);
}

extension ContactDtoListMapper on List<ContactDTO> {
  List<ContactModel> toDomain() => map((dto) => dto.toDomain()).toList();
}
