import 'package:domain/services/services.dart';
import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';
import '../entity/dto/project_dto.dart';
import '../entity/model/project_model.dart';
import '../repository/project_repository.dart';

abstract class GetProjectByIdUseCase {
  Stream<ProjectModel> execute({
    required String id,
  });
}

@Injectable(as: GetProjectByIdUseCase)
class GetProjectByIdUseCaseImpl implements GetProjectByIdUseCase {
  GetProjectByIdUseCaseImpl(
    this.localizationService,
    this.userRepository,
    this.mapper,
  );

  final LocalizationService localizationService;
  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;

  @override
  Stream<ProjectModel> execute({
    required String id,
  }) {
    return userRepository.getProjectById(id, localizationService.locale).map((event) => mapper.mapToModel(event));
  }
}
