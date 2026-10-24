import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// The owner's profile in the current locale.
abstract class GetUserUseCase {
  Stream<PortfolioUserModel> execute();
}

@Injectable(as: GetUserUseCase)
class GetUserUseCaseImpl implements GetUserUseCase {
  GetUserUseCaseImpl(this.config, this.userRepository);

  final Config config;
  final UserRepository userRepository;

  @override
  Stream<PortfolioUserModel> execute() => userRepository.getUser(config.currentLocale);
}
