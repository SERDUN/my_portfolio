import 'package:json_annotation/json_annotation.dart';

import 'project_image_dto.dart';

part 'generation/project_media_dto.g.dart';

@JsonSerializable()
class ProjectMediaDTO {
  @JsonKey(name: 'screenshots')
  final List<ProjectImageDTO> screenshots;

  @JsonKey(name: 'preview')
  final ProjectImageDTO preview;

  ProjectMediaDTO({required this.screenshots, required this.preview});

  factory ProjectMediaDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectMediaDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectMediaDTOToJson(this);
}
