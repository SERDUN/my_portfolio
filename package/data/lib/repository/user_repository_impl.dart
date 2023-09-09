import 'dart:async';

import 'package:data/extension/stream_controller_extensions.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(
    @Named('hasServerSync') this.hasServerSync,
    this.assetDataSource,
    this.apiDatasource,
  );

  final ApiDatasource apiDatasource;
  final AssetsDataSource assetDataSource;

  final bool hasServerSync;

  @override
  Stream<PortfolioUserDTO> getUser(String localization) {
    final StreamController<PortfolioUserDTO> _streamController = StreamController<PortfolioUserDTO>();
    _streamController.addFuture(assetDataSource.getUser(localization));
    _streamController.addFuture(apiDatasource.getUser(localization), ignore: !hasServerSync);
    return _streamController.stream;
  }

  @override
  Stream<List<ContactsDTO>> getContacts(String localization) {
    final StreamController<List<ContactsDTO>> _streamController = StreamController<List<ContactsDTO>>();
    _streamController.addFuture(assetDataSource.getContacts());
    _streamController.addFuture(apiDatasource.getContacts(), ignore: !hasServerSync);
    return _streamController.stream;
  }

  @override
  Stream<List<PortfolioSkillsDTO>> getSkills(String localization) {
    final StreamController<List<PortfolioSkillsDTO>> _streamController = StreamController<List<PortfolioSkillsDTO>>();
    _streamController.addFuture(assetDataSource.getSkills());
    _streamController.addFuture(apiDatasource.getSkills(), ignore: !hasServerSync);
    return _streamController.stream;
  }
}
