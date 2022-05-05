import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/contacts_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/contact/contacts_model.dart';
import 'package:my_portfolio/layers/domain/repository/user_repository.dart';

import '../../common/base_use_case.dart';
import '../../common/mapper_contract.dart';
import '../../entity/model/error/common/either.dart';
import '../../entity/model/error/common/failure.dart';

@Injectable()
class GetContactsUseCase extends BaseUseCase<void, ContactsModel> {
  final UserRepository userRepository;
  final Mapper<ContactsDTO, ContactsModel> mapper;

  GetContactsUseCase(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<Either<Failure, ContactsModel>> execute({void argument}) async {
    ContactsDTO userDTO = (await userRepository.getContacts()).right;
    return Future.value(Right(mapper.mapToModel(userDTO)));
  }
}
