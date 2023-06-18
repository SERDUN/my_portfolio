import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';
import '../entity/dto/contacts_dto.dart';
import '../entity/model/contacts_model.dart';
import '../repository/user_repository.dart';

abstract class GetContactsUseCase {
  Future execute();
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
  Future<ContactsModel> execute() async {
    ContactsDTO userDTO = await userRepository.getContacts();
    return Future.value(mapper.mapToModel(userDTO));
  }
}
