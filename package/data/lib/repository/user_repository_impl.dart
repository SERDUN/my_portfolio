import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final ApiDatasource apiDatasource;
  final AssetsDataSource assetDataSource;

  UserRepositoryImpl(
    this.assetDataSource,
    this.apiDatasource,
  );

  @override
  Future<PortfolioUserDTO> getUser(String localization) async {
    PortfolioUserDTO user = await apiDatasource.getUser(localization);
    // PortfolioUserDTO user = await assetDataSource.getUser(localization);
    return Future.value((user));
  }

  @override
  Future<List<ContactsDTO>> getContacts() async {
    List<ContactsDTO> contacts = await assetDataSource.getContacts();
    // List<ContactsDTO> contacts = await apiDatasource.getContacts();
    return Future.value(contacts);
  }

  @override
  Future<List<PortfolioSkillsDTO>> getSkills(String userId, String localization) async {
    List<PortfolioSkillsDTO> skills = await assetDataSource.getSkills();
    // List<PortfolioSkillsDTO> skills = await apiDatasource.getSkills();
    return Future.value(skills);
  }
}
