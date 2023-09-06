import 'dart:async';

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
  Stream<PortfolioUserDTO> getUser(String localization) {
    final StreamController<PortfolioUserDTO> _streamController = StreamController<PortfolioUserDTO>();
    Future.microtask(() async {
      await _streamController.addStream(assetDataSource.getUser(localization).asStream());
      await _streamController.addStream(apiDatasource.getUser(localization).asStream());
    });
    return _streamController.stream;
  }

  @override
  Future<List<ContactsDTO>> getContacts() async {
    List<ContactsDTO> contacts = await assetDataSource.getContacts();
    // List<ContactsDTO> contacts = await apiDatasource.getContacts();
    return Future.value(contacts);
  }

  @override
  Future<List<PortfolioSkillsDTO>> getSkills(String localization) async {
    List<PortfolioSkillsDTO> skills = await assetDataSource.getSkills();
    // List<PortfolioSkillsDTO> skills = await apiDatasource.getSkills();
    return Future.value(skills);
  }
}
