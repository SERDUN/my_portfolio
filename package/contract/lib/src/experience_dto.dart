import 'package:json_annotation/json_annotation.dart';

part 'experience_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ExperienceDTO {
  ExperienceDTO({this.company, this.role, this.period, this.terms, this.summary, this.highlights});

  final String? company;
  final String? role;
  final String? period;
  final String? terms;
  final String? summary;
  final List<String>? highlights;

  factory ExperienceDTO.fromJson(Map<String, dynamic> json) => _$ExperienceDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceDTOToJson(this);
}
