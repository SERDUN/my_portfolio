import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/project_tags_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/projects/project_tags_model.dart';

import '../../../common/mapper_contract.dart';
import '../../dto/portfolio_skills_dto.dart';
import '../../dto/portfolio_user_dto.dart';
import '../../model/user/portfolio_skills_model.dart';
import '../../model/user/portfolio_user_model.dart';

@Injectable(as: Mapper<ProjectTagsDTO, ProjectTagsModel>)
class ProjectTagsMapper extends Mapper<ProjectTagsDTO, ProjectTagsModel> {
  @override
  ProjectTagsDTO mapToDto(ProjectTagsModel model) {
    throw UnimplementedError();
  }

  @override
  ProjectTagsModel mapToModel(ProjectTagsDTO dto) {
    return ProjectTagsModel(projects: dto.projects, develop: dto.develop);
  }
}
