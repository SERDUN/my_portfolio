import 'package:domain/services/services.dart';
import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';
import '../entity/dto/project_dto.dart';
import '../entity/model/project_model.dart';
import '../repository/project_repository.dart';

abstract class GetProjectByIdUseCase {
  Future<ProjectModel> execute({required String id});
}

@Injectable(as: GetProjectByIdUseCase)
class GetProjectByIdUseCaseImpl implements GetProjectByIdUseCase {
  GetProjectByIdUseCaseImpl(
    this.userRepository,
    this.mapper,
    this.localizationService,
  );

  final LocalizationService localizationService;
  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;

  @override
  Future<ProjectModel> execute({required String id}) async {
    var result = await userRepository.getProjectById(id, localizationService.locale);
    return mapper.mapToModel(result);
  }
}
