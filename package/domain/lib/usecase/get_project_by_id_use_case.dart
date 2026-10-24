import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// One project by id in the current locale.
abstract class GetProjectByIdUseCase {
  Stream<ProjectModel> execute({required String id});
}

@Injectable(as: GetProjectByIdUseCase)
class GetProjectByIdUseCaseImpl implements GetProjectByIdUseCase {
  GetProjectByIdUseCaseImpl(this.config, this.projectRepository);

  final Config config;
  final ProjectRepository projectRepository;

  @override
  Stream<ProjectModel> execute({required String id}) => projectRepository.getProjectById(id, config.currentLocale);
}
