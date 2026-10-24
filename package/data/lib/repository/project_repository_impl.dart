import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';
import '../extension/extension.dart';

/// Serves projects from whichever [PortfolioDataSource] the environment bound.
@Injectable(as: ProjectRepository)
class ProjectRepositoryImpl implements ProjectRepository {
  ProjectRepositoryImpl(this.source);

  final PortfolioDataSource source;

  @override
  Stream<ProjectModel> getProjectById(String id, Language language) async* {
    yield (await source.getProject(id, language)).toDomain();
  }

  @override
  Stream<List<ProjectModel>> getProjects(Language language) async* {
    yield (await source.getProjects(language)).toDomain();
  }
}
