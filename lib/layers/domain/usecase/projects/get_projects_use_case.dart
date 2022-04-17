import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/project_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/default_error.dart';
import 'package:my_portfolio/layers/domain/entity/model/projects/project_model.dart';
import 'package:my_portfolio/layers/domain/entity/model/user/portfolio_user_model.dart';
import 'package:my_portfolio/layers/domain/repository/project_repository.dart';
import 'package:my_portfolio/layers/domain/repository/user_repository.dart';

import '../../common/base_us_case.dart';
import '../../common/mapper_contract.dart';
import '../../entity/dto/portfolio_user_dto.dart';
import '../../entity/model/error/common/either.dart';
import '../../entity/model/error/common/failure.dart';

@Injectable()
class GetProjectsUseCase extends BaseUseCase<void, List<ProjectModel>> {
  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;

  GetProjectsUseCase(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<Either<Failure, List<ProjectModel>>> execute({void argument}) async {
    var result = await userRepository.getProjects();
    if (result.isRight) {
      return Future.value(Right(mapper.mapToModels(result.right)));
    } else {
      return Future.value(Left(result.left));
    }
  }
}
