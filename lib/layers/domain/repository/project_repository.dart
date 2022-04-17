import 'package:my_portfolio/layers/domain/entity/dto/project_dto.dart';

import '../entity/dto/portfolio_user_dto.dart';
import '../entity/model/error/common/either.dart';
import '../entity/model/error/common/failure.dart';
import '../entity/model/projects/project_model.dart';
import '../entity/model/user/portfolio_user_model.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectDTO>>> getProjects();

  Future<Either<Failure, ProjectDTO>> getProjectById(int id);
}
