// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommandGroupDTO _$CommandGroupDTOFromJson(Map<String, dynamic> json) =>
    CommandGroupDTO(
      json['title'] as String,
      (json['commands'] as List<dynamic>)
          .map((e) => CommandDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommandGroupDTOToJson(CommandGroupDTO instance) =>
    <String, dynamic>{'title': instance.title, 'commands': instance.commands};

CommandDTO _$CommandDTOFromJson(Map<String, dynamic> json) =>
    CommandDTO(json['title'] as String, json['command'] as String);

Map<String, dynamic> _$CommandDTOToJson(CommandDTO instance) =>
    <String, dynamic>{'title': instance.title, 'command': instance.command};
