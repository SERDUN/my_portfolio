import 'package:json_annotation/json_annotation.dart';

part 'generation/project_tags_dto.g.dart';

@JsonSerializable()
class ProjectTagsDTO {
  @JsonKey(name: 'projects')
  final List<String> projects;
  @JsonKey(name: 'develop')
  final List<String> develop;

  ProjectTagsDTO({required this.projects, required this.develop});

  factory ProjectTagsDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectTagsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTagsDTOToJson(this);
}
