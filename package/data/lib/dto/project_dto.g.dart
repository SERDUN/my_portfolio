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
      linkGithub: json['linkGithub'] as String?,
      spheres: (json['spheres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      technologies: (json['technologies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      screenshots: (json['screenshots'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preview: json['preview'] as String?,
    );

Map<String, dynamic> _$ProjectDTOToJson(ProjectDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'intro': instance.intro,
      'description': instance.description,
      'linkAndroid': instance.linkAndroid,
      'linkIOS': instance.linkIOS,
      'linkGithub': instance.linkGithub,
      'spheres': instance.spheres,
      'technologies': instance.technologies,
      'screenshots': instance.screenshots,
      'preview': instance.preview,
    };
