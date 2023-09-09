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
    _streamController.addStream(assetDataSource.getUser(localization).asStream());
    _streamController.addStream(apiDatasource.getUser(localization).asStream());
    return _streamController.stream;
  }

  @override
  Stream<List<ContactsDTO>> getContacts(String localization) {
    final StreamController<List<ContactsDTO>> _streamController = StreamController<List<ContactsDTO>>();
    _streamController.addStream(assetDataSource.getContacts().asStream());
    _streamController.addStream(apiDatasource.getContacts().asStream());
    return _streamController.stream;
  }

  @override
  Stream<List<PortfolioSkillsDTO>> getSkills(String localization) {
    final StreamController<List<PortfolioSkillsDTO>> _streamController = StreamController<List<PortfolioSkillsDTO>>();
    _streamController.addStream(assetDataSource.getSkills().asStream());
    _streamController.addStream(apiDatasource.getSkills().asStream());
    return _streamController.stream;
  }
}
