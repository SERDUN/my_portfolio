import 'package:injectable/injectable.dart';
import 'package:my_portfolio/application/logger.dart';
import 'package:my_portfolio/layers/domain/entity/model/user/portfolio_user_model.dart';
import 'package:my_portfolio/layers/domain/repository/setting_repository.dart';
import 'package:my_portfolio/layers/domain/repository/user_repository.dart';

import '../../common/base_use_case.dart';
import '../../common/base_use_case_arg.dart';
import '../../common/mapper_contract.dart';
import '../../entity/dto/portfolio_user_dto.dart';
import '../../entity/model/error/common/either.dart';
import '../../entity/model/error/common/failure.dart';

@Injectable()
class GetUserUseCase extends BaseUseCase<BaseUseCaseArg, PortfolioUserModel> {
  final UserRepository userRepository;
  final Mapper<PortfolioUserDTO, PortfolioUserModel> mapper;
  final String defaultLanguage = "en";

  GetUserUseCase(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<Either<Failure, PortfolioUserModel>> execute(
      {BaseUseCaseArg? argument}) async {
    var language = argument?.local ?? defaultLanguage;
    dLogger.i("GetUserUseCase[$language]");
    PortfolioUserDTO userDTO = (await userRepository.getUser(language)).right;
    return Future.value(Right(mapper.mapToModel(userDTO)));
  }
}
