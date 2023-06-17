// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_tags_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTagsDTO _$ProjectTagsDTOFromJson(Map<String, dynamic> json) =>
    ProjectTagsDTO(
      projects:
          (json['projects'] as List<dynamic>).map((e) => e as String).toList(),
      develop:
          (json['develop'] as List<dynamic>).map((e) => e as String).toList(),
      mainTechnology: json['mainTechnology'] as String,
    );

Map<String, dynamic> _$ProjectTagsDTOToJson(ProjectTagsDTO instance) =>
    <String, dynamic>{
      'mainTechnology': instance.mainTechnology,
      'projects': instance.projects,
      'develop': instance.develop,
    };
