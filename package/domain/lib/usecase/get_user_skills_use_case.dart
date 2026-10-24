import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// Skill groups with their skills.
abstract class GetUserSkillsUseCase {
  Stream<List<PortfolioSkillsModel>> execute({required Language language});
}

@Injectable(as: GetUserSkillsUseCase)
class GetUserSkillsUseCaseImpl implements GetUserSkillsUseCase {
  GetUserSkillsUseCaseImpl(this.userRepository);

  final UserRepository userRepository;

  @override
  Stream<List<PortfolioSkillsModel>> execute({required Language language}) => userRepository.getSkills(language);
}
