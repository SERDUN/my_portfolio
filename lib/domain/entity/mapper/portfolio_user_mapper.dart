import 'package:injectable/injectable.dart';
import 'package:my_portfolio/domain/entity/mapper/portfolio_skills_mapper.dart';
import 'package:my_portfolio/domain/entity/model/user/portfolio_skills_model.dart';

import '../../common/mapper_contract.dart';
import '../dto/portfolio_skills_dto.dart';
import '../dto/portfolio_user_dto.dart';
import '../model/user/portfolio_user_model.dart';

@Injectable(as: Mapper<PortfolioUserDTO, PortfolioUserDTO>)
class PortfolioUserMapper extends Mapper<PortfolioUserDTO, PortfolioUserModel> {
  final PortfolioSkillsMapper mapper;

  PortfolioUserMapper(this.mapper);

  @override
  PortfolioUserModel mapToModel(PortfolioUserDTO dto) {
    return PortfolioUserModel(
        intro: dto.intro ?? "",
        skills: mapper.mapToModels(dto.skills ?? []),
        name: dto.name ?? "",
        position: dto.position ?? "");
  }

  @override
  PortfolioUserDTO mapToDto(PortfolioUserModel model) {
    throw UnimplementedError();
  }
}
