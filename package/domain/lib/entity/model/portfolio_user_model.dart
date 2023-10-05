class PortfolioUserModel {
  PortfolioUserModel({
    required this.firstName,
    required this.secondName,
    required this.position,
    required this.intro,
    required this.avatar,
    required this.cv,
  });

  final String firstName;
  final String secondName;
  final String position;
  final String intro;
  final String avatar;
  final String cv;

  String get name => firstName + secondName;
}
