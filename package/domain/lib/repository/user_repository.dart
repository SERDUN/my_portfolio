import '../entity/model/model.dart';

/// Everything about the owner: profile, skills and contact channels.
abstract class UserRepository {
  /// The owner's profile in [localization] ("en", "uk").
  Stream<PortfolioUserModel> getUser(String localization);

  /// Skill groups with their skills, in [localization].
  Stream<List<PortfolioSkillsModel>> getSkills(String localization);

  /// Contact channels, in [localization].
  Stream<List<ContactsModel>> getContacts(String localization);
}
