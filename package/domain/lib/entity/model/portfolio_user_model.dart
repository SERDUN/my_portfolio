class PortfolioUserModel {
  PortfolioUserModel({
    required this.firstName,
    required this.position,
    required this.secondName,
    required this.cv,
    required this.avatar,
    required this.intro,
  });

  final String firstName;
  final String secondName;
  final String position;
  final String intro;
  final String avatar;
  final String cv;

  String get name => firstName + secondName;
}
