import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';

@Injectable(as: ProjectRepository)
class ProjectRepositoryImpl extends ProjectRepository {
  final AssetsDataSource assetsDatasource;
  final ApiDatasource apiDatasource;

  ProjectRepositoryImpl(this.assetsDatasource, this.apiDatasource);

  @override
  Stream<ProjectDTO> getProjectById(String id, String localization) {
    final StreamController<ProjectDTO> _streamController = StreamController<ProjectDTO>();
    _streamController.addStream(assetsDatasource.getProject(id, localization).asStream());
    _streamController.addStream(apiDatasource.getProject(id, localization).asStream());
    return _streamController.stream;
  }

  @override
  Stream<List<ProjectDTO>> getProjects(String localization) {
    final StreamController<List<ProjectDTO>> _streamController = StreamController<List<ProjectDTO>>();
    _streamController.addStream(assetsDatasource.getProjects(localization).asStream());
    _streamController.addStream(apiDatasource.getProjects(localization).asStream());
    return _streamController.stream;
  }
}
