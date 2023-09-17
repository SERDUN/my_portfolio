import 'package:injectable/injectable.dart';

import 'package:domain/common/common.dart';
import 'package:domain/entity/entity.dart';

@Injectable(as: Mapper<UsefulCommandsDTO, UsefulCommandsModel>)
class UsefulCommandsMapper extends Mapper<UsefulCommandsDTO, UsefulCommandsModel> {
  @override
  UsefulCommandsModel mapToModel(UsefulCommandsDTO dto) {
    return UsefulCommandsModel(dto.title, dto.commands.map((e) => UsefulCommandModel(e.title, e.command)).toList());
  }

  @override
  UsefulCommandsDTO mapToDto(UsefulCommandsModel model) {
    return UsefulCommandsDTO(model.title, model.commands.map((e) => UsefulCommandDTO(e.title, e.command)).toList());
  }
}
