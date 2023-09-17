// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioDTO _$PortfolioDTOFromJson(Map<String, dynamic> json) => PortfolioDTO()
  ..projects = (json['projects'] as List<dynamic>?)
      ?.map((e) => ProjectDTO.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PortfolioDTOToJson(PortfolioDTO instance) =>
    <String, dynamic>{
      'projects': instance.projects,
    };
