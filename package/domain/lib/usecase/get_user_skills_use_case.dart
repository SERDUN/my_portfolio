// ignore_for_file: null_argument_to_non_null_type

import 'package:domain/domain.dart';
import 'package:domain/services/services.dart';
import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';

abstract class GetUserSkillsUseCase {
  Future<List<PortfolioSkillsModel>> execute();
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
  Future<List<PortfolioSkillsModel>> execute() async {
    try {
      final dtos = await userRepository.getSkills(localizationService.locale);
      final models = dtos.nonNulls.map((dto) => mapper.mapToModel(dto)).toList();
      return Future.value(models);
    } catch (e) {
      return Future.value(null);
    }
  }
}
