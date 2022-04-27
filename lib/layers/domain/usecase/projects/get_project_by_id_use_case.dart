import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/project_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/default_error.dart';
import 'package:my_portfolio/layers/domain/entity/model/projects/project_model.dart';
import 'package:my_portfolio/layers/domain/repository/project_repository.dart';

import '../../common/base_us_case.dart';
import '../../common/mapper_contract.dart';
import '../../entity/model/error/common/either.dart';
import '../../entity/model/error/common/failure.dart';

@Injectable()
class GetProjectByIdUseCase extends BaseUseCase<int, ProjectModel> {
  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;

  GetProjectByIdUseCase(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<Either<Failure, ProjectModel>> execute({int? argument}) async {
    if (argument != null) {
      var result = await userRepository.getProjectById(argument);
      if (result.isRight) {
        return Future.value(Right(mapper.mapToModel(result.right)));
      } else {
        return Future.value(Left(result.left));
      }
    } else {
      return Future.value(Left(DefaultFailure("Project id cannot be missing")));
    }
  }
}
