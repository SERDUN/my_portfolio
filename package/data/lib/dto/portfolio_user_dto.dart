import 'package:json_annotation/json_annotation.dart';

part 'portfolio_user_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PortfolioUserDTO {
  PortfolioUserDTO({
    this.firstName,
    this.secondName,
    this.position,
    this.intro,
    this.avatarUrl,
    this.cvUrl,
  });

  final String? firstName;
  final String? secondName;
  final String? avatarUrl;
  final String? cvUrl;
  final String? position;
  final String? intro;

  factory PortfolioUserDTO.fromJson(Map<String, dynamic> json) => _$PortfolioUserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioUserDTOToJson(this);
}
