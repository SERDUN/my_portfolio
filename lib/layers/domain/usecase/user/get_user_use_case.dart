import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/model/user/portfolio_user_model.dart';
import 'package:my_portfolio/layers/domain/repository/user_repository.dart';

import '../../common/base_us_case.dart';
import '../../common/mapper_contract.dart';
import '../../entity/dto/portfolio_user_dto.dart';
import '../../entity/model/error/common/either.dart';
import '../../entity/model/error/common/failure.dart';

@Injectable()
class GetUserUseCase extends BaseUseCase<void, PortfolioUserModel> {
  final UserRepository userRepository;
  final Mapper<PortfolioUserDTO, PortfolioUserModel> mapper;

  GetUserUseCase(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<Either<Failure, PortfolioUserModel>> execute({void argument}) async {
    PortfolioUserDTO userDTO = (await userRepository.getUser()).right;
    return Future.value(Right(mapper.mapToModel(userDTO)));
  }
}
