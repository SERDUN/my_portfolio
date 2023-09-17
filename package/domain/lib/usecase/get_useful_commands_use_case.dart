// ignore_for_file: null_argument_to_non_null_type
import 'package:injectable/injectable.dart';

import 'package:data/data.dart';

import 'package:domain/entity/entity.dart';
import 'package:domain/repository/repository.dart';
import 'package:domain/common/common.dart';

abstract class GetUsefulCommandsUseCase {
  Stream<List<UsefulCommandsModel>> execute();
}

@Injectable(as: GetUsefulCommandsUseCase)
class GetUsefulCommandsUseCaseImpl implements GetUsefulCommandsUseCase {
  GetUsefulCommandsUseCaseImpl(
    this.config,
    this.usefulRepository,
    this.mapper,
  );

  final Config config;
  final UsefulRepository usefulRepository;
  final Mapper<UsefulCommandsDTO , UsefulCommandsModel> mapper;

  @override
  Stream<List<UsefulCommandsModel>> execute() {
    return usefulRepository
        .getUsefulCommands(config.currentLocale)
        .map((event) => event.map((dto) => mapper.mapToModel(dto)).toList());
  }
}
