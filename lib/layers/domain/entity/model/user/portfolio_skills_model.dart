class PortfolioSkillsModel {
  final String title;
  final bool expanded;
  final List<PortfolioSkillsModel> children;

  PortfolioSkillsModel(
      {required this.title, required this.expanded, required this.children});
}
