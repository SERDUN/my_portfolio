import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:data/extension/extension.dart';
import 'package:domain/repository/repository.dart';

import '../dto/dto.dart';
import '../datasource/datasource.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(
    @Named('hasServerSync') this.hasServerSync,
    @Named('hasLocalSync') this.hasLocalSync,
    this.assetDataSource,
    this.apiDatasource,
  );

  final ApiDatasource apiDatasource;
  final AssetsDataSource assetDataSource;

  final bool hasServerSync;
  final bool hasLocalSync;

  @override
  Stream<PortfolioUserDTO> getUser(String localization) {
    final StreamController<PortfolioUserDTO> _streamController = StreamController<PortfolioUserDTO>();
    Future.microtask(() async {
      if (hasLocalSync) await _streamController.addFuture(assetDataSource.getUser(localization));
      if (hasServerSync) await _streamController.addFuture(apiDatasource.getUser(localization));
    });

    return _streamController.stream;
  }

  @override
  Stream<List<ContactsDTO>> getContacts(String localization) {
    final StreamController<List<ContactsDTO>> _streamController = StreamController<List<ContactsDTO>>();
    Future.microtask(() async {
      if (hasLocalSync) await _streamController.addFuture(assetDataSource.getContacts());
      if (hasServerSync) await _streamController.addFuture(apiDatasource.getContacts());
    });

    return _streamController.stream;
  }

  @override
  Stream<List<PortfolioSkillsDTO>> getSkills(String localization) {
    final StreamController<List<PortfolioSkillsDTO>> _streamController = StreamController<List<PortfolioSkillsDTO>>();
    Future.microtask(() async {
      if (hasLocalSync) await _streamController.addFuture(assetDataSource.getSkills(localization));
      if (hasServerSync) await _streamController.addFuture(apiDatasource.getSkills(localization));
    });

    return _streamController.stream;
  }
}
