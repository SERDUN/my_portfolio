// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useful_commands_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsefulCommandsDTO _$UsefulCommandsDTOFromJson(Map<String, dynamic> json) =>
    UsefulCommandsDTO(
      json['title'] as String,
      (json['commands'] as List<dynamic>)
          .map((e) => UsefulCommandDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsefulCommandsDTOToJson(UsefulCommandsDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'commands': instance.commands,
    };

UsefulCommandDTO _$UsefulCommandDTOFromJson(Map<String, dynamic> json) =>
    UsefulCommandDTO(
      json['title'] as String,
      json['command'] as String,
    );

Map<String, dynamic> _$UsefulCommandDTOToJson(UsefulCommandDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'command': instance.command,
    };
