// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceDTO _$ExperienceDTOFromJson(Map<String, dynamic> json) => ExperienceDTO(
  company: json['company'] as String?,
  role: json['role'] as String?,
  period: json['period'] as String?,
  terms: json['terms'] as String?,
  summary: json['summary'] as String?,
  highlights: (json['highlights'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ExperienceDTOToJson(ExperienceDTO instance) => <String, dynamic>{
  'company': instance.company,
  'role': instance.role,
  'period': instance.period,
  'terms': instance.terms,
  'summary': instance.summary,
  'highlights': instance.highlights,
};
