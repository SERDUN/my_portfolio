import 'package:my_portfolio/layers/domain/entity/dto/contacts_dto.dart';

import '../entity/dto/portfolio_user_dto.dart';
import '../entity/model/error/common/either.dart';
import '../entity/model/error/common/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, PortfolioUserDTO>> getUser();

  Future<Either<Failure, ContactsDTO>> getContacts();
}
