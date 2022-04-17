import 'package:json_annotation/json_annotation.dart';
import 'project_media_dto.dart';
import 'project_tags_dto.dart';
part 'generation/project_dto.g.dart';

@JsonSerializable()
class ProjectDTO {
  final int? id;
  final String? name;
  final String? intro;
  final String? description;
  final String? linkAndroid;
  final String? linkIOS;
  final String? linkSource;
  final ProjectTagsDTO? tags;
  final ProjectMediaDTO? media;

  ProjectDTO({this.id,this.name, this.intro, this.description, this.linkAndroid, this.linkIOS, this.linkSource, this.tags, this.media});


  factory ProjectDTO.fromJson(Map<String, dynamic> json) => _$ProjectDTOFromJson(json);


  Map<String, dynamic> toJson() => _$ProjectDTOToJson(this);

}

