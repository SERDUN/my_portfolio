import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';
import '../entity/dto/portfolio_user_dto.dart';
import '../entity/model/portfolio_user_model.dart';
import '../repository/user_repository.dart';

abstract class GetUserUseCase {
  Future<PortfolioUserModel> execute({required String lang});
}

@Injectable(as: GetUserUseCase)
class GetUserUseCaseImpl implements GetUserUseCase {
  final UserRepository userRepository;
  final Mapper<PortfolioUserDTO, PortfolioUserModel> mapper;
  final String defaultLanguage = "en";

  GetUserUseCaseImpl(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<PortfolioUserModel> execute({required String lang}) async {
    PortfolioUserDTO userDTO = (await userRepository.getUser(lang));
    return Future.value(mapper.mapToModel(userDTO));
  }
}
