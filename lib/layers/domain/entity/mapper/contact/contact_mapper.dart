import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/contacts_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/contact/contacts_model.dart';

import '../../../common/mapper_contract.dart';

@Injectable(as: Mapper<ContactsDTO, ContactsModel>)
class ContactMapper extends Mapper<ContactsDTO, ContactsModel> {
  @override
  ContactsModel mapToModel(ContactsDTO dto) {
    return ContactsModel(
        mail: dto.mail,
        phone: dto.phone,
        location: dto.location,
        githubUsername: dto.githubUsername,
        githubLink: dto.githubLink,
        linkedinUsername: dto.linkedinUsername,
        linkedinLink: dto.linkedinLink,
        instagramUsername: dto.instagramUsername,
        instagramLink: dto.instagramLink,
        facebookUsername: dto.facebookUsername,
        facebookLink: dto.facebookLink);
  }

  @override
  ContactsDTO mapToDto(ContactsModel model) {
    throw UnimplementedError();
  }
}
