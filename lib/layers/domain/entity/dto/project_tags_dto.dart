import 'package:json_annotation/json_annotation.dart';

part 'project_tags_dto.g.dart';

@JsonSerializable()
class ProjectTagsDTO {
  @JsonKey(name: 'mainTechnology')
  final String mainTechnology;
  @JsonKey(name: 'projects')
  final List<String> projects;
  @JsonKey(name: 'develop')
  final List<String> develop;

  ProjectTagsDTO(
      {required this.projects,
      required this.develop,
      required this.mainTechnology});

  factory ProjectTagsDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectTagsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTagsDTOToJson(this);
}
