import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';
import '../entity/dto/contacts_dto.dart';
import '../entity/model/contacts_model.dart';
import '../repository/user_repository.dart';

abstract class GetContactsUseCase {
  Future<List<ContactsModel>> execute();
}

@Injectable(as: GetContactsUseCase)
class GetContactsUseCaseImpl implements GetContactsUseCase {
  final UserRepository userRepository;
  final Mapper<ContactsDTO, ContactsModel> mapper;

  GetContactsUseCaseImpl(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<List<ContactsModel>> execute() async {
    List<ContactsDTO> contacts = await userRepository.getContacts();
    List<ContactsModel> models = contacts.map((data) => mapper.mapToModel(data)).toList();
    return models;
  }
}
