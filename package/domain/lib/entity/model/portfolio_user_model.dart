/// The portfolio owner.
class PortfolioUserModel {
  PortfolioUserModel({
    required this.firstName,
    required this.secondName,
    required this.position,
    required this.intro,
    this.avatar,
    this.cv,
    this.location = '',
    this.headline = '',
    this.headlineAccent = '',
    this.experienceSince,
  });

  final String firstName;
  final String secondName;
  final String position;
  final String intro;

  /// Portrait image; null when the data has none.
  final Uri? avatar;

  /// The CV document; null hides every "Download CV" button.
  final Uri? cv;

  /// "Odesa, Ukraine"; empty when the data has none.
  final String location;

  /// One-sentence statement for the hero; empty when the data has none.
  final String headline;

  /// Tail of [headline] set in the accent color; empty for none.
  final String headlineAccent;

  /// Year the career started, or null when unknown.
  final int? experienceSince;

  String get name => '$firstName $secondName';

  /// Full years since [experienceSince], or null when unknown.
  int? yearsOfExperience([DateTime? now]) {
    final since = experienceSince;
    if (since == null) return null;
    final years = (now ?? DateTime.now()).year - since;
    return years < 0 ? 0 : years;
  }
}
