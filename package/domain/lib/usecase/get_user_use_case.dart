import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// The owner's profile.
abstract class GetUserUseCase {
  Stream<PortfolioUserModel> execute({required Language language});
}

@Injectable(as: GetUserUseCase)
class GetUserUseCaseImpl implements GetUserUseCase {
  GetUserUseCaseImpl(this.userRepository);

  final UserRepository userRepository;

  @override
  Stream<PortfolioUserModel> execute({required Language language}) => userRepository.getUser(language);
}
