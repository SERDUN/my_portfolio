import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// All projects in the current locale.
abstract class GetProjectsUseCase {
  Stream<List<ProjectModel>> execute();
}

@Injectable(as: GetProjectsUseCase)
class GetProjectsUseCaseImpl implements GetProjectsUseCase {
  GetProjectsUseCaseImpl(this.config, this.projectRepository);

  final Config config;
  final ProjectRepository projectRepository;

  @override
  Stream<List<ProjectModel>> execute() => projectRepository.getProjects(config.currentLocale);
}
