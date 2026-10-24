import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// Skill groups in the current locale.
abstract class GetUserSkillsUseCase {
  Stream<List<PortfolioSkillsModel>> execute();
}

@Injectable(as: GetUserSkillsUseCase)
class GetUserSkillsUseCaseImpl implements GetUserSkillsUseCase {
  GetUserSkillsUseCaseImpl(this.config, this.userRepository);

  final Config config;
  final UserRepository userRepository;

  @override
  Stream<List<PortfolioSkillsModel>> execute() => userRepository.getSkills(config.currentLocale);
}
