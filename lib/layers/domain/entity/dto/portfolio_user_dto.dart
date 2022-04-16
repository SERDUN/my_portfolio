import 'package:my_portfolio/domain/entity/dto/portfolio_skills_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generation/portfolio_user_dto.g.dart';

@JsonSerializable()
class PortfolioUserDTO {
  final String? name;
  final String? position;
  final String? intro;
  final List<PortfolioSkillsDTO>? skills;

  PortfolioUserDTO({this.name, this.position, this.intro, this.skills});

  factory PortfolioUserDTO.fromJson(Map<String, dynamic> json) =>
      _$PortfolioUserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioUserDTOToJson(this);
}
