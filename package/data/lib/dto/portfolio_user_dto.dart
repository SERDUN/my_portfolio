import 'package:json_annotation/json_annotation.dart';

import 'experience_dto.dart';

part 'portfolio_user_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PortfolioUserDTO {
  PortfolioUserDTO({
    this.firstName,
    this.secondName,
    this.position,
    this.location,
    this.headline,
    this.headlineAccent,
    this.experienceSince,
    this.intro,
    this.avatarUrl,
    this.cvUrl,
    this.experience,
  });

  final String? firstName;
  final String? secondName;
  final String? avatarUrl;
  final String? cvUrl;
  final String? position;

  /// "Odesa, Ukraine": shown next to the position in the hero eyebrow.
  final String? location;

  /// One-sentence statement for the hero.
  final String? headline;

  /// Tail of [headline] that is set in the accent color, if any.
  final String? headlineAccent;

  /// Year the career started; the hero derives "N+ years" from it.
  final int? experienceSince;
  final String? intro;

  /// Places of work, newest first.
  final List<ExperienceDTO>? experience;

  factory PortfolioUserDTO.fromJson(Map<String, dynamic> json) => _$PortfolioUserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioUserDTOToJson(this);
}
