import 'package:json_annotation/json_annotation.dart';

part 'skill_group_dto.g.dart';

@JsonSerializable()
class SkillGroupDTO {
  final String title;
  bool? expanded;
  List<SkillGroupDTO> subskills;

  SkillGroupDTO({required this.title, this.subskills = const []});

  factory SkillGroupDTO.fromJson(Map<String, dynamic> json) => _$SkillGroupDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SkillGroupDTOToJson(this);
}
