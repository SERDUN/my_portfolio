import 'package:injectable/injectable.dart';

import 'package:data/data.dart';

import '../../common/mapper_contract.dart';
import '../model/contacts_model.dart';

@Injectable(as: Mapper<ContactsDTO, ContactsModel>)
class ContactMapper extends Mapper<ContactsDTO, ContactsModel> {
  @override
  ContactsModel mapToModel(ContactsDTO dto) {
    return ContactsModel(
      title: dto.title,
      value: dto.value,
    );
  }

  @override
  ContactsDTO mapToDto(ContactsModel model) {
    throw UnimplementedError();
  }
}
