import 'package:injectable/injectable.dart';

import '../../common/mapper_contract.dart';
import '../dto/portfolio_skills_dto.dart';
import '../dto/portfolio_user_dto.dart';
import '../model/portfolio_skills_model.dart';
import '../model/portfolio_user_model.dart';

@Injectable(as: Mapper<PortfolioUserDTO, PortfolioUserModel>)
class PortfolioUserMapper extends Mapper<PortfolioUserDTO, PortfolioUserModel> {
  final Mapper<PortfolioSkillsDTO, PortfolioSkillsModel> mapper;

  PortfolioUserMapper(this.mapper);

  @override
  PortfolioUserModel mapToModel(PortfolioUserDTO dto) {
    return PortfolioUserModel(
      firstName: dto.firstName ?? '',
      secondName: dto.secondName ?? '',
      intro: dto.intro ?? "",
      avatar: dto.avatarUrl ?? "",
      cv: dto.cvUrl ?? "",
      // skills: mapper.mapToModels(dto.skills ?? []),
      position: dto.position ?? "",
    );
  }

  @override
  PortfolioUserDTO mapToDto(PortfolioUserModel model) {
    throw UnimplementedError();
  }
}
