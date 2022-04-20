import '../entity/dto/portfolio_user_dto.dart';
import '../entity/model/error/common/either.dart';
import '../entity/model/error/common/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, PortfolioUserDTO>> getUser();
}
