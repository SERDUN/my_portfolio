import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/project_image_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/projects/project_image_model.dart';

import '../../../common/mapper_contract.dart';
import '../../dto/portfolio_skills_dto.dart';
import '../../dto/portfolio_user_dto.dart';
import '../../model/user/portfolio_skills_model.dart';
import '../../model/user/portfolio_user_model.dart';

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
