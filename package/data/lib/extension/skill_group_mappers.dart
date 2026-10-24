import 'package:domain/domain.dart';

import '../dto/skill_group_dto.dart';

extension SkillGroupDtoMapper on SkillGroupDTO {
  /// A top-level entry is a group and its subskills are the skills. The data
  /// has two levels; anything nested deeper is not shown and not mapped. The
  /// JSON's `expanded` flag is a leftover of the old tree view.
  SkillGroupModel toDomain() =>
      SkillGroupModel(title: title, skills: subskills.map((s) => SkillModel(s.title)).toList());
}

extension SkillGroupDtoListMapper on List<SkillGroupDTO> {
  List<SkillGroupModel> toDomain() => map((dto) => dto.toDomain()).toList();
}
