import 'package:injectable/injectable.dart';

import '../../../common/mapper_contract.dart';
import '../../dto/project_dto.dart';
import '../../dto/project_media_dto.dart';
import '../../dto/project_tags_dto.dart';
import '../../model/projects/project_media_model.dart';
import '../../model/projects/project_model.dart';
import '../../model/projects/project_tags_model.dart';

@Injectable(as: Mapper<ProjectDTO, ProjectModel>)
class ProjectMapper extends Mapper<ProjectDTO, ProjectModel> {
  final Mapper<ProjectTagsDTO, ProjectTagsModel> mapperTags;
  final Mapper<ProjectMediaDTO, ProjectMediaModel> mapperMedia;

  ProjectMapper(this.mapperTags, this.mapperMedia);

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
        linkAndroid: dto.linkAndroid??"",
        linkIOS: dto.linkIOS??"",
        linkSource: dto.linkSource??"",
        tags: mapperTags.mapToModel(dto.tags!),
        media: mapperMedia.mapToModel(dto.media!));
  }
}
