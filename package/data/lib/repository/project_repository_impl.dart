import 'package:injectable/injectable.dart';

import 'package:collection/collection.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';

@Injectable(as: ProjectRepository)
class ProjectRepositoryImpl extends ProjectRepository {
  final AssetsDataSource source;
  final ApiDatasource apiDatasource;

  ProjectRepositoryImpl(this.source, this.apiDatasource);

  @override
  Future<ProjectDTO> getProjectById(String id, String localization) async {
    var projects = await getProjects(localization);
    var project = projects.firstWhereOrNull((element) => element.id == id);
    return Future.value(project);
  }

  @override
  Future<List<ProjectDTO>> getProjects(String localization) async {
    List<ProjectDTO> projects = await source.getProjects(localization);
    // List<ProjectDTO> projects = await apiDatasource.getProjects('en');
    return projects ?? [];
  }
}
