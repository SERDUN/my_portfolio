import '../common/common.dart';
import '../entity/model/model.dart';

/// Everything about the owner: profile, skills and contact channels.
abstract class UserRepository {
  /// The owner's profile in [language].
  Stream<PortfolioUserModel> getUser(Language language);

  /// Skill groups with their skills, in [language].
  Stream<List<SkillGroupModel>> getSkills(Language language);

  /// Contact channels, in [language].
  Stream<List<ContactModel>> getContacts(Language language);
}
