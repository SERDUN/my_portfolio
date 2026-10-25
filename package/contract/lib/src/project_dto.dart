import 'package:json_annotation/json_annotation.dart';

part 'project_dto.g.dart';

@JsonSerializable()
class ProjectDTO {
  final String? id;
  final String? name;

  /// "flutter" or "android"; older data without it is inferred from the stack.
  final String? platform;
  final String? intro;
  final String? description;
  final String? linkAndroid;
  final String? linkIOS;
  final String? linkGithub;
  final List<String> spheres;
  final List<String> technologies;
  @JsonKey(name: 'screenshots')
  final List<String> screenshots;
  @JsonKey(name: 'preview')
  final String? preview;

  /// Shown in the "selected work" block on the home page.
  @JsonKey(defaultValue: false)
  final bool featured;

  ProjectDTO({
    this.id,
    this.name,
    this.platform,
    this.intro,
    this.description,
    this.linkAndroid,
    this.linkIOS,
    this.linkGithub,
    this.spheres = const [],
    this.technologies = const [],
    this.screenshots = const [],
    this.preview,
    this.featured = false,
  });

  factory ProjectDTO.fromJson(Map<String, dynamic> json) => _$ProjectDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDTOToJson(this);
}
