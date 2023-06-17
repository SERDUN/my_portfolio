// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_skills_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioSkillsDTO _$PortfolioSkillsDTOFromJson(Map<String, dynamic> json) =>
    PortfolioSkillsDTO(
      title: json['title'] as String,
      children: (json['children'] as List<dynamic>?)
              ?.map(
                  (e) => PortfolioSkillsDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    )..expanded = json['expanded'] as bool?;

Map<String, dynamic> _$PortfolioSkillsDTOToJson(PortfolioSkillsDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'expanded': instance.expanded,
      'children': instance.children,
    };
