import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/contacts_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/contact/contacts_model.dart';
import 'package:my_portfolio/layers/domain/entity/model/user/portfolio_user_model.dart';
import 'package:my_portfolio/layers/domain/repository/setting_repository.dart';
import 'package:my_portfolio/layers/domain/repository/user_repository.dart';

import '../../../data/repository/user_repository_impl.dart';
import '../../common/base_us_case.dart';
import '../../common/mapper_contract.dart';
import '../../entity/dto/portfolio_user_dto.dart';
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
