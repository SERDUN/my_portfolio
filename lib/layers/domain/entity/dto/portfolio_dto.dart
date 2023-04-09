import 'package:json_annotation/json_annotation.dart';
import 'package:my_portfolio/layers/domain/entity/dto/project_dto.dart';

part 'portfolio_dto.g.dart';

@JsonSerializable()
class PortfolioDTO {
  // int? version;
  List<ProjectDTO>? projects;

  PortfolioDTO();

  factory PortfolioDTO.fromJson(Map<String, dynamic> json) =>
      _$PortfolioDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioDTOToJson(this);
}
