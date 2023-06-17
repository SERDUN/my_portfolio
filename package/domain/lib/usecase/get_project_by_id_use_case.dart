import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';
import '../entity/dto/project_dto.dart';
import '../entity/model/project_model.dart';
import '../repository/project_repository.dart';

abstract class GetProjectByIdUseCase {
  Future<ProjectModel> execute({required String id, required String lang});
}

@Injectable(as: GetProjectByIdUseCase)
class GetProjectByIdUseCaseImpl implements GetProjectByIdUseCase {
  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;

  GetProjectByIdUseCaseImpl(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<ProjectModel> execute({required String id, required String lang}) async {
    var result = await userRepository.getProjectById(id, lang);
    return mapper.mapToModel(result);
  }
}
