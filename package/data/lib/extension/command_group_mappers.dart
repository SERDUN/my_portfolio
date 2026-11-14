import 'package:domain/domain.dart';

import '../dto/dto.dart';

extension CommandDtoMapper on CommandDTO {
  CommandModel toDomain() => CommandModel(title, command);
}

extension CommandGroupDtoMapper on CommandGroupDTO {
  CommandGroupModel toDomain() => CommandGroupModel(title, commands.map((c) => c.toDomain()).toList());
}

extension CommandGroupDtoListMapper on List<CommandGroupDTO> {
  List<CommandGroupModel> toDomain() => map((dto) => dto.toDomain()).toList();
}
