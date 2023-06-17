
import '../entity/dto/contacts_dto.dart';
import '../entity/dto/portfolio_user_dto.dart';

abstract class UserRepository {
  Future< PortfolioUserDTO> getUser(String localization);

  Future<ContactsDTO> getContacts();
}
