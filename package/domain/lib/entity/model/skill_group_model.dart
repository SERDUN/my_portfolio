/// A group of skills ("Flutter") with the skills in it. Display state such
/// as whether a group is expanded belongs to the UI, not here.
class SkillGroupModel {
  SkillGroupModel({required this.title, this.skills = const []});

  final String title;
  final List<SkillModel> skills;
}

/// One skill inside a group ("BLoC").
class SkillModel {
  const SkillModel(this.title);

  final String title;
}
