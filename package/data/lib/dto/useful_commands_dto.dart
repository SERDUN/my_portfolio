import 'package:json_annotation/json_annotation.dart';

part 'useful_commands_dto.g.dart';

@JsonSerializable()
class UsefulCommandsDTO {
  UsefulCommandsDTO(
    this.title,
    this.commands,
  );

  final String title;

  final List<UsefulCommandDTO> commands;

  factory UsefulCommandsDTO.fromJson(Map<String, dynamic> json) => _$UsefulCommandsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UsefulCommandsDTOToJson(this);
}

@JsonSerializable()
class UsefulCommandDTO {
  UsefulCommandDTO(
    this.title,
    this.command,
  );

  final String title;
  final String command;

  factory UsefulCommandDTO.fromJson(Map<String, dynamic> json) => _$UsefulCommandDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UsefulCommandDTOToJson(this);
}
