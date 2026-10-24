import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// One project by id; errors when there is none.
abstract class GetProjectByIdUseCase {
  Stream<ProjectModel> execute({required String id, required Language language});
}

@Injectable(as: GetProjectByIdUseCase)
class GetProjectByIdUseCaseImpl implements GetProjectByIdUseCase {
  GetProjectByIdUseCaseImpl(this.projectRepository);

  final ProjectRepository projectRepository;

  @override
  Stream<ProjectModel> execute({required String id, required Language language}) => projectRepository.getProjectById(id, language);
}
