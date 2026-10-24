import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// All projects in display order.
abstract class GetProjectsUseCase {
  Stream<List<ProjectModel>> execute({required Language language});
}

@Injectable(as: GetProjectsUseCase)
class GetProjectsUseCaseImpl implements GetProjectsUseCase {
  GetProjectsUseCaseImpl(this.projectRepository);

  final ProjectRepository projectRepository;

  @override
  Stream<List<ProjectModel>> execute({required Language language}) => projectRepository.getProjects(language);
}
