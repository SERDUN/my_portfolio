// ignore_for_file: null_argument_to_non_null_type
import 'package:injectable/injectable.dart';

import 'package:data/data.dart';

import 'package:domain/entity/entity.dart';
import 'package:domain/repository/repository.dart';
import 'package:domain/common/common.dart';

abstract class GetUserSkillsUseCase {
  Stream<List<PortfolioSkillsModel>> execute();
}

@Injectable(as: GetUserSkillsUseCase)
class GetUserUseCaseSkillsImpl implements GetUserSkillsUseCase {
  GetUserUseCaseSkillsImpl(
    this.config,
    this.userRepository,
    this.mapper,
  );

  final Config config;
  final UserRepository userRepository;
  final Mapper<PortfolioSkillsDTO, PortfolioSkillsModel> mapper;

  @override
  Stream<List<PortfolioSkillsModel>> execute() {
    return userRepository
        .getSkills(config.currentLocale)
        .map((event) => event.map((dto) => mapper.mapToModel(dto)).toList());
  }
}
