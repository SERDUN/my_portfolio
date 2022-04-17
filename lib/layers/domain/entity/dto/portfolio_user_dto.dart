import 'package:json_annotation/json_annotation.dart';

import 'portfolio_skills_dto.dart';

part 'generation/portfolio_user_dto.g.dart';

@JsonSerializable()
class PortfolioUserDTO {
  final String? name;
  @JsonKey(name: 'avatarUrl')
  final String? avatar;
  @JsonKey(name: 'cvUrl')
  final String? cv;
  final String? position;
  final String? intro;
  final List<PortfolioSkillsDTO>? skills;

  PortfolioUserDTO(
      {this.name,
      this.position,
      this.intro,
      this.skills,
      this.avatar,
      this.cv});

  factory PortfolioUserDTO.fromJson(Map<String, dynamic> json) =>
      _$PortfolioUserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioUserDTOToJson(this);
}
