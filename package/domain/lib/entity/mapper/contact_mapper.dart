import 'package:injectable/injectable.dart';


import '../../common/mapper_contract.dart';
import '../dto/contacts_dto.dart';
import '../model/contacts_model.dart';

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
