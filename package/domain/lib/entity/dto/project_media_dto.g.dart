// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectMediaDTO _$ProjectMediaDTOFromJson(Map<String, dynamic> json) =>
    ProjectMediaDTO(
      screenshots: (json['screenshots'] as List<dynamic>)
          .map((e) => ProjectImageDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      preview:
          ProjectImageDTO.fromJson(json['preview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectMediaDTOToJson(ProjectMediaDTO instance) =>
    <String, dynamic>{
      'screenshots': instance.screenshots,
      'preview': instance.preview,
    };
