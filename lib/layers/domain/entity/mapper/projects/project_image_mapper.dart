import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/project_image_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/projects/project_image_model.dart';

import '../../../common/mapper_contract.dart';

@Injectable(as: Mapper<ProjectImageDTO, ProjectImageModel>)
class ProjectImageMapper extends Mapper<ProjectImageDTO, ProjectImageModel> {
  @override
  ProjectImageDTO mapToDto(ProjectImageModel model) {
    // TODO: implement mapToDto
    throw UnimplementedError();
  }

  @override
  ProjectImageModel mapToModel(ProjectImageDTO dto) {
    return ProjectImageModel(url: dto.url, fitType: dto.fitType);
  }
}
