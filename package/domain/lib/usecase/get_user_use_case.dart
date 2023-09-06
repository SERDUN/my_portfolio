// ignore_for_file: null_argument_to_non_null_type

import 'package:domain/services/services.dart';
import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';
import '../entity/dto/portfolio_user_dto.dart';
import '../entity/model/portfolio_user_model.dart';
import '../repository/user_repository.dart';

abstract class GetUserUseCase {
  Future<PortfolioUserModel> execute();
}

@Injectable(as: GetUserUseCase)
class GetUserUseCaseImpl implements GetUserUseCase {
  GetUserUseCaseImpl(
    this.localizationService,
    this.userRepository,
    this.mapper,
  );

  final LocalizationService localizationService;
  final UserRepository userRepository;
  final Mapper<PortfolioUserDTO, PortfolioUserModel> mapper;

  @override
  Future<PortfolioUserModel> execute() async {
    try {
      PortfolioUserDTO userDTO = await userRepository.getUser(localizationService.locale);
      return Future.value(mapper.mapToModel(userDTO));
    } catch (e) {
      return Future.value(null);
    }
  }
}
