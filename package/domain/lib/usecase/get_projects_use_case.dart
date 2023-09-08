import 'package:injectable/injectable.dart';

import 'package:domain/services/services.dart';

import '../common/mapper_contract.dart';
import '../entity/dto/project_dto.dart';
import '../entity/model/project_model.dart';
import '../repository/project_repository.dart';

abstract class GetProjectsUseCase {
  Stream<List<ProjectModel>> execute();
}

@Injectable(as: GetProjectsUseCase)
class GetProjectsUseCaseImpl implements GetProjectsUseCase {
  GetProjectsUseCaseImpl(
    this.userRepository,
    this.mapper,
    this.localizationService,
  );

  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;
  final LocalizationService localizationService;

  @override
  Stream<List<ProjectModel>> execute() {
    return userRepository.getProjects(localizationService.locale).map((event) => mapper.mapToModels(event));
  }
}
