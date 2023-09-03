import 'package:json_annotation/json_annotation.dart';

part 'project_dto.g.dart';

@JsonSerializable()
class ProjectDTO {
  final String? id;
  final String? name;
  final String? intro;
  final String? description;
  final String? linkAndroid;
  final String? linkIOS;
  final String? linkSource;
  final List<String> spheres;
  final List<String> technologies;
  @JsonKey(name: 'screenshots')
  final List<String> screenshots;
  @JsonKey(name: 'preview')
  final String? preview;

  ProjectDTO({
    this.id,
    this.name,
    this.intro,
    this.description,
    this.linkAndroid,
    this.linkIOS,
    this.linkSource,
    this.spheres = const [],
    this.technologies = const [],
    this.screenshots = const [],
    this.preview,
  });

  factory ProjectDTO.fromJson(Map<String, dynamic> json) => _$ProjectDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDTOToJson(this);
}
