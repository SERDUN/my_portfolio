class PortfolioSkillsModel {
  PortfolioSkillsModel({
    required this.title,
    required this.expanded,
    required this.children,
  });

  final String title;
  final bool expanded;
  final List<PortfolioSkillsModel> children;
}
