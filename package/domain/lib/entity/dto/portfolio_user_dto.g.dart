// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioUserDTO _$PortfolioUserDTOFromJson(Map<String, dynamic> json) =>
    PortfolioUserDTO(
      firstName: json['first_name'] as String?,
      secondName: json['second_name'] as String?,
      position: json['position'] as String?,
      intro: json['intro'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      cvUrl: json['cv_url'] as String?,
    );

Map<String, dynamic> _$PortfolioUserDTOToJson(PortfolioUserDTO instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'second_name': instance.secondName,
      'avatar_url': instance.avatarUrl,
      'cv_url': instance.cvUrl,
      'position': instance.position,
      'intro': instance.intro,
    };
