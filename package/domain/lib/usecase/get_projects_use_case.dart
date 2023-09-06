import 'package:domain/services/services.dart';
import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';
import '../entity/dto/project_dto.dart';
import '../entity/model/project_model.dart';
import '../repository/project_repository.dart';

abstract class GetProjectsUseCase {
  Future<List<ProjectModel>> execute();
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
  Future<List<ProjectModel>> execute() async {
    var result = await userRepository.getProjects(localizationService.locale);
    return mapper.mapToModels(result);
  }
}
