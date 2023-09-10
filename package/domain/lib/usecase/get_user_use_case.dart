// ignore_for_file: null_argument_to_non_null_type
import 'package:injectable/injectable.dart';

import 'package:domain/entity/entity.dart';
import 'package:domain/repository/repository.dart';
import 'package:domain/common/common.dart';

abstract class GetUserUseCase {
  Stream<PortfolioUserModel> execute();
}

@Injectable(as: GetUserUseCase)
class GetUserUseCaseImpl implements GetUserUseCase {
  GetUserUseCaseImpl(
    this.config,
    this.userRepository,
    this.mapper,
  );

  final Config config;
  final UserRepository userRepository;
  final Mapper<PortfolioUserDTO, PortfolioUserModel> mapper;

  @override
  Stream<PortfolioUserModel> execute() {
    return userRepository.getUser(config.currentLocale).map((event) => mapper.mapToModel(event));
  }
}
