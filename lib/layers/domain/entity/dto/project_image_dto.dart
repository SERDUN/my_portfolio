import 'package:json_annotation/json_annotation.dart';

part 'project_image_dto.g.dart';

@JsonSerializable()
class ProjectImageDTO {
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'fitType')
  final String? fitType;

  ProjectImageDTO({required this.url, this.fitType});

  factory ProjectImageDTO.fromJson(Map<String, dynamic> json) => _$ProjectImageDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectImageDTOToJson(this);
}
