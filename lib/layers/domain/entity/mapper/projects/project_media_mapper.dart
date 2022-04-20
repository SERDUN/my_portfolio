import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/project_media_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/projects/project_media_model.dart';

import '../../../common/mapper_contract.dart';
import '../../dto/project_image_dto.dart';
import '../../model/projects/project_image_model.dart';

@Injectable(as: Mapper<ProjectMediaDTO, ProjectMediaModel>)
class ProjectMediaMapper extends Mapper<ProjectMediaDTO, ProjectMediaModel> {
  final Mapper<ProjectImageDTO, ProjectImageModel> imageMapper;

  ProjectMediaMapper(this.imageMapper);

  @override
  ProjectMediaDTO mapToDto(ProjectMediaModel model) {
    throw UnimplementedError();
  }

  @override
  ProjectMediaModel mapToModel(ProjectMediaDTO dto) {
    return ProjectMediaModel(
        screenshots: imageMapper.mapToModels(dto.screenshots),
        preview: imageMapper.mapToModel(dto.preview));
  }
}
