import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final AssetsDataSource source;

  UserRepositoryImpl(this.source);

  @override
  Future<PortfolioUserDTO> getUser(String localization) async {
    PortfolioUserDTO user = await source.getUserData(localization);
    return Future.value((user));
  }

  @override
  Future<ContactsDTO> getContacts() async {
    ContactsDTO user = await source.getContactData();
    return Future.value(user);
  }
}
