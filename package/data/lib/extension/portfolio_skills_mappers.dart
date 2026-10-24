import 'package:domain/domain.dart';

import '../dto/portfolio_skills_dto.dart';

extension PortfolioSkillsDtoMapper on PortfolioSkillsDTO {
  /// Maps the group and its subskills recursively. The JSON's `expanded`
  /// flag is a leftover of the old tree view and is not carried over.
  PortfolioSkillsModel toDomain() => PortfolioSkillsModel(title: title, children: subskills.toDomain());
}

extension PortfolioSkillsDtoListMapper on List<PortfolioSkillsDTO> {
  List<PortfolioSkillsModel> toDomain() => map((dto) => dto.toDomain()).toList();
}
