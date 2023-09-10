import 'package:injectable/injectable.dart';

import 'package:domain/entity/entity.dart';
import 'package:domain/repository/repository.dart';
import 'package:domain/common/common.dart';

abstract class GetContactsUseCase {
  Stream<List<ContactsModel>> execute();
}

@Injectable(as: GetContactsUseCase)
class GetContactsUseCaseImpl implements GetContactsUseCase {
  GetContactsUseCaseImpl(
    this.config,
    this.userRepository,
    this.mapper,
  );

  final Config config;
  final UserRepository userRepository;
  final Mapper<ContactsDTO, ContactsModel> mapper;

  @override
  Stream<List<ContactsModel>> execute() {
    return userRepository
        .getContacts(config.currentLocale)
        .map((event) => event.map((data) => mapper.mapToModel(data)).toList());
  }
}
