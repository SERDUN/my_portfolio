/// A group of skills ("Flutter") with the skills in it. Display state such
/// as whether a group is expanded belongs to the UI, not here.
class PortfolioSkillsModel {
  PortfolioSkillsModel({required this.title, this.children = const []});

  final String title;
  final List<PortfolioSkillsModel> children;
}
