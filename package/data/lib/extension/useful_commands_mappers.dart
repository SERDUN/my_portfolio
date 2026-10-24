import 'package:domain/domain.dart';

import '../dto/useful_commands_dto.dart';

extension UsefulCommandDtoMapper on UsefulCommandDTO {
  UsefulCommandModel toDomain() => UsefulCommandModel(title, command);
}

extension UsefulCommandsDtoMapper on UsefulCommandsDTO {
  UsefulCommandsModel toDomain() => UsefulCommandsModel(title, commands.map((c) => c.toDomain()).toList());
}

extension UsefulCommandsDtoListMapper on List<UsefulCommandsDTO> {
  List<UsefulCommandsModel> toDomain() => map((dto) => dto.toDomain()).toList();
}
