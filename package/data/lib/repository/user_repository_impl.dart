import 'package:injectable/injectable.dart';

import 'package:domain/entity/entity.dart';

import 'package:domain/repository/repository.dart';

import '../datasource/local/assets_data_source.dart';

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
