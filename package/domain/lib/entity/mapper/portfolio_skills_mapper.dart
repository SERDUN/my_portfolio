import 'package:injectable/injectable.dart';

import 'package:data/data.dart';

import '../../common/mapper_contract.dart';
import '../model/portfolio_skills_model.dart';

@Injectable(as: Mapper<PortfolioSkillsDTO, PortfolioSkillsModel>)
class PortfolioSkillsMapper extends Mapper<PortfolioSkillsDTO, PortfolioSkillsModel> {
  @override
  PortfolioSkillsModel mapToModel(PortfolioSkillsDTO dto) {
    return PortfolioSkillsModel(
        children: mapToModels(dto.subskills), expanded: dto.expanded ?? false, title: dto.title);
  }

  @override
  PortfolioSkillsDTO mapToDto(PortfolioSkillsModel model) {
    throw UnimplementedError();
  }
}
