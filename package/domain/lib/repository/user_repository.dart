import 'package:domain/domain.dart';

abstract class UserRepository {
  Stream<PortfolioUserDTO> getUser(String localization);

  Stream<List<PortfolioSkillsDTO>> getSkills(String localization);

  Stream<List<ContactsDTO>> getContacts(String localization);
}
