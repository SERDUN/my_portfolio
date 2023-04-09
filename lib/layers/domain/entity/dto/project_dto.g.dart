// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDTO _$ProjectDTOFromJson(Map<String, dynamic> json) => ProjectDTO(
      id: json['id'] as String?,
      name: json['name'] as String?,
      intro: json['intro'] as String?,
      description: json['description'] as String?,
      linkAndroid: json['linkAndroid'] as String?,
      linkIOS: json['linkIOS'] as String?,
      linkSource: json['linkSource'] as String?,
      tags: json['tags'] == null
          ? null
          : ProjectTagsDTO.fromJson(json['tags'] as Map<String, dynamic>),
      media: json['media'] == null
          ? null
          : ProjectMediaDTO.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectDTOToJson(ProjectDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'intro': instance.intro,
      'description': instance.description,
      'linkAndroid': instance.linkAndroid,
      'linkIOS': instance.linkIOS,
      'linkSource': instance.linkSource,
      'tags': instance.tags,
      'media': instance.media,
    };
