import 'package:injectable/injectable.dart';

import 'package:collection/collection.dart';

import 'package:domain/entity/entity.dart';
import 'package:domain/repository/repository.dart';

import '../datasource/local/assets_data_source.dart';

@Injectable(as: ProjectRepository)
class ProjectRepositoryImpl extends ProjectRepository {
  final AssetsDataSource source;

  ProjectRepositoryImpl(this.source);

  @override
  Future<ProjectDTO> getProjectById(String id, String localization) async {
    var projects = await getProjects(localization);
    var project = projects.firstWhereOrNull((element) => element.id == id);
    return Future.value(project);
  }

  @override
  Future<List<ProjectDTO>> getProjects(String localization) async {
    PortfolioDTO user = await source.getProjectData(localization);
    return Future.value(user.projects ?? []);
  }
}
