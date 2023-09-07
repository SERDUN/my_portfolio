import 'dart:math';

import 'package:domain/services/services.dart';
import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';
import '../entity/dto/contacts_dto.dart';
import '../entity/model/contacts_model.dart';
import '../repository/user_repository.dart';

abstract class GetContactsUseCase {
  Stream<List<ContactsModel>> execute();
}

@Injectable(as: GetContactsUseCase)
class GetContactsUseCaseImpl implements GetContactsUseCase {
  GetContactsUseCaseImpl(
    this.localizationService,
    this.userRepository,
    this.mapper,
  );

  final LocalizationService localizationService;
  final UserRepository userRepository;
  final Mapper<ContactsDTO, ContactsModel> mapper;

  @override
  Stream<List<ContactsModel>> execute() {
    return userRepository
        .getContacts(localizationService.locale)
        .map((event) => event.map((data) => mapper.mapToModel(data)).toList());
  }
}
