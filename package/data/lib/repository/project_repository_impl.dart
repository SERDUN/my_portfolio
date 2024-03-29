import 'dart:async';

import 'package:data/extension/stream_controller_extensions.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';

import '../dto/dto.dart';
import '../datasource/datasource.dart';

@Injectable(as: ProjectRepository)
class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRepositoryImpl(
    @Named('hasServerSync') this.hasServerSync,
    @Named('hasLocalSync') this.hasLocalSync,
    this.assetsDatasource,
    this.apiDatasource,
  );

  final AssetsDataSource assetsDatasource;
  final ApiDatasource apiDatasource;

  final bool hasServerSync;
  final bool hasLocalSync;

  @override
  Stream<ProjectDTO> getProjectById(String id, String localization) {
    final StreamController<ProjectDTO> _streamController = StreamController<ProjectDTO>();
    Future.microtask(() async {
      if (hasLocalSync) await _streamController.addFuture(assetsDatasource.getProject(id, localization));
      if (hasServerSync) await _streamController.addFuture(apiDatasource.getProject(id, localization));
    });
    return _streamController.stream;
  }

  @override
  Stream<List<ProjectDTO>> getProjects(String localization) {
    final StreamController<List<ProjectDTO>> _streamController = StreamController<List<ProjectDTO>>();
    Future.microtask(() async {
      if (hasLocalSync) await _streamController.addFuture(assetsDatasource.getProjects(localization));
      if (hasServerSync) await _streamController.addFuture(apiDatasource.getProjects(localization));
    });
    return _streamController.stream;
  }
}
