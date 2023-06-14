import 'package:injectable/injectable.dart';

import 'package:my_portfolio/core/core.dart';

import 'package:my_portfolio/layers/domain/entity/dto/project_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/default_error.dart';
import 'package:my_portfolio/layers/domain/entity/model/projects/project_model.dart';
import 'package:my_portfolio/layers/domain/repository/project_repository.dart';

import '../../common/base_use_case.dart';
import '../../common/mapper_contract.dart';
import '../../entity/argument/project_details_arg.dart';
import '../../entity/model/error/common/either.dart';
import '../../entity/model/error/common/failure.dart';

@Injectable()
class GetProjectByIdUseCase
    extends BaseUseCase<ProjectDetailsArg, ProjectModel> {
  final ProjectRepository userRepository;
  final Mapper<ProjectDTO, ProjectModel> mapper;

  GetProjectByIdUseCase(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<Either<Failure, ProjectModel>> execute(
      {ProjectDetailsArg? argument}) async {
    if (argument != null) {
      var language = argument.local ?? BaseUseCase.defaultLanguage;
      dLogger.i("GetUserUseCase[$language]");
      var result = await userRepository.getProjectById(argument.id, language);
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
