import 'package:domain/domain.dart';

class InfoState {
  final PortfolioUserModel? userModel;
  final List<PortfolioSkillsModel>? skills;

  InfoState({this.userModel, this.skills});

  InfoState init() {
    return InfoState();
  }

  InfoState clone() {
    return InfoState();
  }

  InfoState fill(PortfolioUserModel userModel) {
    return InfoState(userModel: userModel);
  }

  // TODO: RENAME
  InfoState fillSkills(List<PortfolioSkillsModel> skills) {
    return InfoState(skills: skills, userModel: userModel);
  }
}
