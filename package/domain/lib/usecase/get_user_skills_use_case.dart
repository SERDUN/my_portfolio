// ignore_for_file: null_argument_to_non_null_type

import 'package:domain/domain.dart';
import 'package:domain/services/services.dart';
import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';

abstract class GetUserSkillsUseCase {
  Stream<List<PortfolioSkillsModel>> execute();
}

@Injectable(as: GetUserSkillsUseCase)
class GetUserUseCaseSkillsImpl implements GetUserSkillsUseCase {
  GetUserUseCaseSkillsImpl(
    this.localizationService,
    this.userRepository,
    this.mapper,
  );

  final LocalizationService localizationService;
  final UserRepository userRepository;
  final Mapper<PortfolioSkillsDTO, PortfolioSkillsModel> mapper;

  @override
  Stream<List<PortfolioSkillsModel>> execute() {
    return userRepository
        .getSkills(localizationService.locale)
        .map((event) => event.map((dto) => mapper.mapToModel(dto)).toList());
  }
}
