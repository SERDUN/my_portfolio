/// One place of work in the career timeline, newest first in the data.
class ExperienceModel {
  ExperienceModel({
    required this.company,
    required this.role,
    this.period = '',
    this.terms = '',
    this.summary = '',
    this.highlights = const [],
  });

  final String company;
  final String role;

  /// "Jul 2022 – present": written in the data per language, not computed.
  final String period;

  /// "full-time, remote"; empty when the data has none.
  final String terms;

  /// One paragraph about the place; may be empty.
  final String summary;

  /// The points worth reading first, one sentence each.
  final List<String> highlights;
}
