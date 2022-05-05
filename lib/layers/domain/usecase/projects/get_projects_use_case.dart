import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/project_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/projects/project_model.dart';
import 'package:my_portfolio/layers/domain/repository/project_repository.dart';

import '../../common/base_use_case.dart';
import '../../common/base_use_case_arg.dart';
import '../../common/mapper_contract.dart';
import '../../entity/model/error/common/either.dart';
import '../../entity/model/error/common/failure.dart';

@Injectable()
class GetProjectsUseCase
    extends BaseUseCase<BaseUseCaseArg, List<ProjectModel>> {
  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;

  GetProjectsUseCase(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<Either<Failure, List<ProjectModel>>> execute(
      {BaseUseCaseArg? argument}) async {
    var language = argument?.local ?? BaseUseCase.defaultLanguage;

    var result = await userRepository.getProjects(language);
    if (result.isRight) {
      return Future.value(Right(mapper.mapToModels(result.right)));
    } else {
      return Future.value(Left(result.left));
    }
  }
}
