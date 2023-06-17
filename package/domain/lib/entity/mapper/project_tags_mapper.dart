import 'package:injectable/injectable.dart';

import '../../common/mapper_contract.dart';
import '../dto/project_tags_dto.dart';
import '../model/project_tags_model.dart';


@Injectable(as: Mapper<ProjectTagsDTO, ProjectTagsModel>)
class ProjectTagsMapper extends Mapper<ProjectTagsDTO, ProjectTagsModel> {
  @override
  ProjectTagsDTO mapToDto(ProjectTagsModel model) {
    throw UnimplementedError();
  }

  @override
  ProjectTagsModel mapToModel(ProjectTagsDTO dto) {
    return ProjectTagsModel(
        projects: dto.projects,
        develop: dto.develop,
        mainTechnology: dto.mainTechnology);
  }
}
