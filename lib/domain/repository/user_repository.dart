import '../entity/model/error/common/either.dart';
import '../entity/model/error/common/failure.dart';
import '../entity/model/user/portfolio_user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, PortfolioUserModel>> getUser();
}
