import 'portfolio_skills_model.dart';

class PortfolioUserModel {
  final String firstName;
  final String secondName;
  final String position;
  final String intro;
  final String avatar;
  final String cv;
  // final List<PortfolioSkillsModel> skills;

  PortfolioUserModel({
    required this.firstName,
    required this.position,
    required this.secondName,
    required this.cv,
    required this.avatar,
    required this.intro,
    // required this.skills,
  });

  String get name => firstName + secondName;
}
