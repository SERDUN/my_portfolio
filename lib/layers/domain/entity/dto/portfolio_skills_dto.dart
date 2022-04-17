import 'package:json_annotation/json_annotation.dart';

part 'generation/portfolio_skills_dto.g.dart';

@JsonSerializable()
class PortfolioSkillsDTO {
  final String title;
  bool? expanded;
  List<PortfolioSkillsDTO> children;

  PortfolioSkillsDTO({required this.title,this.children=const []});

  factory PortfolioSkillsDTO.fromJson(Map<String, dynamic> json) =>
      _$PortfolioSkillsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioSkillsDTOToJson(this);
}
