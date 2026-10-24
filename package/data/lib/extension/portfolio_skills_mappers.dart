import 'package:domain/domain.dart';

import '../dto/portfolio_skills_dto.dart';

extension PortfolioSkillsDtoMapper on PortfolioSkillsDTO {
  /// Maps the group and its subskills recursively; a missing `expanded`
  /// reads as collapsed.
  PortfolioSkillsModel toDomain() => PortfolioSkillsModel(
        title: title,
        expanded: expanded ?? false,
        children: subskills.toDomain(),
      );
}

extension PortfolioSkillsDtoListMapper on List<PortfolioSkillsDTO> {
  List<PortfolioSkillsModel> toDomain() => map((dto) => dto.toDomain()).toList();
}
