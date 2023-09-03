import 'package:domain/domain.dart';

import '../entity/dto/contacts_dto.dart';
import '../entity/dto/portfolio_user_dto.dart';

abstract class UserRepository {
  Future<PortfolioUserDTO> getUser(String localization);

  Future<List<PortfolioSkillsDTO>> getSkills(String userId, String localization);

  Future<List<ContactsDTO>> getContacts();
}
