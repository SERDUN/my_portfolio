import 'package:injectable/injectable.dart';


import '../common/mapper_contract.dart';
import '../entity/dto/project_dto.dart';
import '../entity/model/project_model.dart';
import '../repository/project_repository.dart';

abstract class GetProjectsUseCase {
  Future<List<ProjectModel>> execute({required String lang});
}

@Injectable(as: GetProjectsUseCase)
class GetProjectsUseCaseImpl implements GetProjectsUseCase {
  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;

  GetProjectsUseCaseImpl(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<List<ProjectModel>> execute({required String lang}) async {
    var result = await userRepository.getProjects(lang!);
    return mapper.mapToModels(result);
  }
}
