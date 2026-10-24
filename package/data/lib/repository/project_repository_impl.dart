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
  Stream<ProjectModel> getProjectById(String id, Language language) async* {
    _requireSource();
    if (hasLocalSync) yield (await assetsDatasource.getProject(id, language)).toDomain();
    if (hasServerSync) yield (await apiDatasource.getProject(id, language)).toDomain();
  }

  @override
  Stream<List<ProjectModel>> getProjects(Language language) async* {
    _requireSource();
    if (hasLocalSync) yield (await assetsDatasource.getProjects(language)).toDomain();
    if (hasServerSync) yield (await apiDatasource.getProjects(language)).toDomain();
  }

  void _requireSource() {
    if (!hasLocalSync && !hasServerSync) throw StateError('ProjectRepositoryImpl has no data source enabled');
  }
}
