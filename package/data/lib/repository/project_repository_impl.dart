import 'dart:async';

import 'package:data/extension/stream_controller_extensions.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

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
    if (hasLocalSync) _streamController.addFuture(assetsDatasource.getProject(id, localization));
    if (hasServerSync) _streamController.addFuture(apiDatasource.getProject(id, localization));
    return _streamController.stream;
  }

  @override
  Stream<List<ProjectDTO>> getProjects(String localization) {
    final StreamController<List<ProjectDTO>> _streamController = StreamController<List<ProjectDTO>>();
    if (hasLocalSync) _streamController.addFuture(assetsDatasource.getProjects(localization));
    if (hasServerSync) _streamController.addFuture(apiDatasource.getProjects(localization));
    return _streamController.stream;
  }
}
