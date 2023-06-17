import 'package:injectable/injectable.dart';

import '../../common/mapper_contract.dart';
import '../dto/project_image_dto.dart';
import '../model/project_image_model.dart';

@Injectable(as: Mapper<ProjectImageDTO, ProjectImageModel>)
class ProjectImageMapper extends Mapper<ProjectImageDTO, ProjectImageModel> {
  @override
  ProjectImageDTO mapToDto(ProjectImageModel model) {
    throw UnimplementedError();
  }

  @override
  ProjectImageModel mapToModel(ProjectImageDTO dto) {
    return ProjectImageModel(url: dto.url, fitType: dto.fitType);
  }
}
