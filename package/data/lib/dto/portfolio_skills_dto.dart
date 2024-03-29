import 'package:json_annotation/json_annotation.dart';

part 'portfolio_skills_dto.g.dart';

@JsonSerializable()
class PortfolioSkillsDTO {
  final String title;
  bool? expanded;
  List<PortfolioSkillsDTO> subskills;

  PortfolioSkillsDTO({
    required this.title,
    this.subskills = const [],
  });

  factory PortfolioSkillsDTO.fromJson(Map<String, dynamic> json) => _$PortfolioSkillsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioSkillsDTOToJson(this);
}
