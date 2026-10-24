import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';
import '../extension/extension.dart';

/// Serves projects from the bundled assets and, when enabled, refreshes them
/// from the API afterwards. Each stream completes after the last enabled
/// source and errors when none is enabled.
@Injectable(as: ProjectRepository)
class ProjectRepositoryImpl implements ProjectRepository {
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
  Stream<ProjectModel> getProjectById(String id, String localization) async* {
    _requireSource();
    if (hasLocalSync) yield (await assetsDatasource.getProject(id, localization)).toDomain();
    if (hasServerSync) yield (await apiDatasource.getProject(id, localization)).toDomain();
  }

  @override
  Stream<List<ProjectModel>> getProjects(String localization) async* {
    _requireSource();
    if (hasLocalSync) yield (await assetsDatasource.getProjects(localization)).toDomain();
    if (hasServerSync) yield (await apiDatasource.getProjects(localization)).toDomain();
  }

  void _requireSource() {
    if (!hasLocalSync && !hasServerSync) throw StateError('ProjectRepositoryImpl has no data source enabled');
  }
}
