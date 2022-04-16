import 'dart:convert';
import 'package:my_portfolio/domain/entity/dto/portfolio_user_dto.dart';
import 'package:my_portfolio/domain/entity/dto/project_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generation/portfolio_dto.g.dart';

@JsonSerializable()
class PortfolioDTO {
  int? version;
  List<ProjectDTO>? projects;
  PortfolioUserDTO? user;

  PortfolioDTO();

  factory PortfolioDTO.fromJson(Map<String, dynamic> json) =>
      _$PortfolioDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioDTOToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
