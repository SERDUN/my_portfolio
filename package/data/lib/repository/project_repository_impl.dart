import 'dart:async';

import 'package:data/extension/stream_controller_extensions.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';

@Injectable(as: ProjectRepository)
class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRepositoryImpl(
    @Named('hasServerSync') this.hasServerSync,
    this.assetsDatasource,
    this.apiDatasource,
  );

  final AssetsDataSource assetsDatasource;
  final ApiDatasource apiDatasource;

  final bool hasServerSync;

  @override
  Stream<ProjectDTO> getProjectById(String id, String localization) {
    final StreamController<ProjectDTO> _streamController = StreamController<ProjectDTO>();
    _streamController.addFuture(assetsDatasource.getProject(id, localization));
    _streamController.addFuture(apiDatasource.getProject(id, localization), ignore: !hasServerSync);
    return _streamController.stream;
  }

  @override
  Stream<List<ProjectDTO>> getProjects(String localization) {
    final StreamController<List<ProjectDTO>> _streamController = StreamController<List<ProjectDTO>>();
    _streamController.addFuture(assetsDatasource.getProjects(localization));
    _streamController.addFuture(apiDatasource.getProjects(localization), ignore: !hasServerSync);
    return _streamController.stream;
  }
}
