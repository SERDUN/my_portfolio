// ignore_for_file: null_argument_to_non_null_type

import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../common/mapper_contract.dart';

abstract class GetUserSkillsUseCase {
  Future<List<PortfolioSkillsModel>> execute({
    required String lang,
  });
}

@Injectable(as: GetUserSkillsUseCase)
class GetUserUseCaseSkillsImpl implements GetUserSkillsUseCase {
  final UserRepository userRepository;
  final Mapper<PortfolioSkillsDTO, PortfolioSkillsModel> mapper;
  final String defaultLanguage = "en";

  GetUserUseCaseSkillsImpl(
    this.userRepository,
    this.mapper,
  );

  @override
  Future<List<PortfolioSkillsModel>> execute({
    required String lang,
  }) async {
    try {
      final dtos = await userRepository.getSkills("R5KVoOkqVztd4uxKxTCt", lang);
      final models = dtos.nonNulls.map((dto) => mapper.mapToModel(dto)).toList();
      return Future.value(models);
    } catch (e) {
      return Future.value(null);
    }
  }
}
