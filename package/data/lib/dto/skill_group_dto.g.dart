// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillGroupDTO _$SkillGroupDTOFromJson(Map<String, dynamic> json) =>
    SkillGroupDTO(
      title: json['title'] as String,
      subskills:
          (json['subskills'] as List<dynamic>?)
              ?.map((e) => SkillGroupDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    )..expanded = json['expanded'] as bool?;

Map<String, dynamic> _$SkillGroupDTOToJson(SkillGroupDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'expanded': instance.expanded,
      'subskills': instance.subskills,
    };
