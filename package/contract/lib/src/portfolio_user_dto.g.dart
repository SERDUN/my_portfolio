// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioUserDTO _$PortfolioUserDTOFromJson(Map<String, dynamic> json) => PortfolioUserDTO(
  firstName: json['first_name'] as String?,
  secondName: json['second_name'] as String?,
  position: json['position'] as String?,
  location: json['location'] as String?,
  headline: json['headline'] as String?,
  headlineAccent: json['headline_accent'] as String?,
  experienceSince: (json['experience_since'] as num?)?.toInt(),
  intro: json['intro'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  cvUrl: json['cv_url'] as String?,
  experience: (json['experience'] as List<dynamic>?)
      ?.map((e) => ExperienceDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PortfolioUserDTOToJson(PortfolioUserDTO instance) => <String, dynamic>{
  'first_name': instance.firstName,
  'second_name': instance.secondName,
  'avatar_url': instance.avatarUrl,
  'cv_url': instance.cvUrl,
  'position': instance.position,
  'location': instance.location,
  'headline': instance.headline,
  'headline_accent': instance.headlineAccent,
  'experience_since': instance.experienceSince,
  'intro': instance.intro,
  'experience': instance.experience?.map((e) => e.toJson()).toList(),
};
