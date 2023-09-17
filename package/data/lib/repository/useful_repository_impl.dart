import 'dart:async';

import 'package:data/extension/stream_controller_extensions.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';

@Injectable(as: UsefulRepository)
class UsefulRepositoryImpl extends UsefulRepository {
  UsefulRepositoryImpl(
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
  Stream<List<UsefulCommandsDTO>> getUsefulCommands(String localization) {
    final StreamController<List<UsefulCommandsDTO>> _streamController = StreamController<List<UsefulCommandsDTO>>();
    Future.microtask(() async {
      if (hasLocalSync) await _streamController.addFuture(assetDataSource.getUsefulCommand(localization));
    });

    return _streamController.stream;
  }
}
