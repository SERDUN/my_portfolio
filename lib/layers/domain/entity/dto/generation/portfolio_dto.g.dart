// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../portfolio_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioDTO _$PortfolioDTOFromJson(Map<String, dynamic> json) => PortfolioDTO()
  ..version = json['version'] as int?
  ..projects = (json['projects'] as List<dynamic>?)
      ?.map((e) => ProjectDTO.fromJson(e as Map<String, dynamic>))
      .toList()
  ..user = json['user'] == null
      ? null
      : PortfolioUserDTO.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$PortfolioDTOToJson(PortfolioDTO instance) =>
    <String, dynamic>{
      'version': instance.version,
      'projects': instance.projects,
      'user': instance.user,
    };
