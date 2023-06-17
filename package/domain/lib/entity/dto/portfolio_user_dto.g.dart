// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioUserDTO _$PortfolioUserDTOFromJson(Map<String, dynamic> json) =>
    PortfolioUserDTO(
      name: json['name'] as String?,
      position: json['position'] as String?,
      intro: json['intro'] as String?,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => PortfolioSkillsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      avatar: json['avatarUrl'] as String?,
      cv: json['cvUrl'] as String?,
    );

Map<String, dynamic> _$PortfolioUserDTOToJson(PortfolioUserDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatarUrl': instance.avatar,
      'cvUrl': instance.cv,
      'position': instance.position,
      'intro': instance.intro,
      'skills': instance.skills,
    };
