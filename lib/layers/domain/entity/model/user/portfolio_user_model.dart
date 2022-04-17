
import 'package:my_portfolio/layers/domain/entity/model/user/portfolio_skills_model.dart';

class PortfolioUserModel {
  final String name;
  final String position;
  final String intro;
  final String avatar;
  final String cv;
  final List<PortfolioSkillsModel> skills;

  PortfolioUserModel(
      {required this.name,
      required this.position,
      required this.cv,
      required this.avatar,
      required this.intro,
      required this.skills});
}
