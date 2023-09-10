import 'package:injectable/injectable.dart';

import 'package:domain/common/common.dart';

import 'package:domain/entity/entity.dart';
import 'package:domain/repository/repository.dart';

abstract class GetProjectsUseCase {
  Stream<List<ProjectModel>> execute();
}

@Injectable(as: GetProjectsUseCase)
class GetProjectsUseCaseImpl implements GetProjectsUseCase {
  GetProjectsUseCaseImpl(
    this.config,
    this.userRepository,
    this.mapper,
  );

  final Config config;
  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;

  @override
  Stream<List<ProjectModel>> execute() {
    return userRepository.getProjects(config.currentLocale).map((event) => mapper.mapToModels(event));
  }
}
