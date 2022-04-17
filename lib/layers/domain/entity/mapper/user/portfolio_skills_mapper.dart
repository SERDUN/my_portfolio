import 'package:injectable/injectable.dart';
import '../../../common/mapper_contract.dart';
import '../../dto/portfolio_skills_dto.dart';
import '../../model/user/portfolio_skills_model.dart';

@Injectable(as: Mapper<PortfolioSkillsDTO, PortfolioSkillsModel>)
class PortfolioSkillsMapper extends Mapper<PortfolioSkillsDTO, PortfolioSkillsModel> {

  @override
  PortfolioSkillsModel mapToModel(PortfolioSkillsDTO dto) {
    return PortfolioSkillsModel(children: mapToModels(dto.children), expanded: dto.expanded??false, title: dto.title);
  }

  @override
  PortfolioSkillsDTO mapToDto(PortfolioSkillsModel model) {
    throw UnimplementedError();
  }
}
