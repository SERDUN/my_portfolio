import 'package:json_annotation/json_annotation.dart';

part 'command_group_dto.g.dart';

@JsonSerializable()
class CommandGroupDTO {
  CommandGroupDTO(this.title, this.commands);

  final String title;

  final List<CommandDTO> commands;

  factory CommandGroupDTO.fromJson(Map<String, dynamic> json) => _$CommandGroupDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CommandGroupDTOToJson(this);
}

@JsonSerializable()
class CommandDTO {
  CommandDTO(this.title, this.command);

  final String title;
  final String command;

  factory CommandDTO.fromJson(Map<String, dynamic> json) => _$CommandDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CommandDTOToJson(this);
}
