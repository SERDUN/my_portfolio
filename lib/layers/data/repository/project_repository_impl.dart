import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/project_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/default_error.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/either.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/failure.dart';

import '../../domain/entity/dto/portfolio_dto.dart';
import '../../domain/repository/project_repository.dart';
import '../datasource/local/assets_data_source.dart';

@Injectable(as: ProjectRepository)
class ProjectRepositoryImpl extends ProjectRepository {
  final AssetsDataSource source;

  ProjectRepositoryImpl(this.source);

  @override
  Future<Either<Failure, ProjectDTO>> getProjectById(int id) async {
    var projects = await getProjects();
    if (projects.isRight) {
      var project =
          projects.right.firstWhereOrNull((element) => element.id == id);
      if (project != null) {
        return Future.value(Right(project));
      } else {
        return Future.value(
            Left(DefaultFailure("Project with this ID was not found")));
      }
    } else {
      return Future.value(Left(projects.left));
    }
  }

  @override
  Future<Either<Failure, List<ProjectDTO>>> getProjects() async {
    try {
      PortfolioDTO user = await source.getProjectData();
      return Future.value(Right(user.projects ?? []));
    } on Exception catch (e) {
      //Logic for handle depend from datasource
      return Future.value(Left(DefaultFailure(e.toString())));
    }
  }
}
