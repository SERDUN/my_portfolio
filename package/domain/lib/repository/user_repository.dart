import 'package:domain/domain.dart';

abstract class UserRepository {
  Stream<PortfolioUserDTO> getUser(String localization);

  Future<List<PortfolioSkillsDTO>> getSkills(String userId, String localization);

  Future<List<ContactsDTO>> getContacts();
}
