import 'package:injectable/injectable.dart';

import 'package:data/data.dart';

import '../../common/mapper_contract.dart';
import '../model/project_model.dart';

@Injectable(as: Mapper<ProjectDTO, ProjectModel>)
class ProjectMapper extends Mapper<ProjectDTO, ProjectModel> {
  ProjectMapper();

  @override
  ProjectDTO mapToDto(ProjectModel model) {
    throw UnimplementedError();
  }

  @override
  ProjectModel mapToModel(ProjectDTO dto) {
    return ProjectModel(
        name: dto.name,
        id: dto.id,
        intro: dto.intro,
        description: dto.description?.trim(),
        linkAndroid: dto.linkAndroid ?? "",
        linkIOS: dto.linkIOS ?? "",
        linkGithub: dto.linkGithub ?? "",
        technologies: dto.technologies,
        spheres: dto.spheres,
        screenshots: dto.screenshots,
        preview: dto.preview);
  }
}
