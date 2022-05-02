import 'package:my_portfolio/layers/domain/entity/dto/project_dto.dart';

import '../entity/model/error/common/either.dart';
import '../entity/model/error/common/failure.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectDTO>>> getProjects(String localization);

  Future<Either<Failure, ProjectDTO>> getProjectById(
      int id, String localization);
}
