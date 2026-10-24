import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// Command groups of the cheat sheet.
abstract class GetUsefulCommandsUseCase {
  Stream<List<UsefulCommandsModel>> execute({required Language language});
}

@Injectable(as: GetUsefulCommandsUseCase)
class GetUsefulCommandsUseCaseImpl implements GetUsefulCommandsUseCase {
  GetUsefulCommandsUseCaseImpl(this.usefulRepository);

  final UsefulRepository usefulRepository;

  @override
  Stream<List<UsefulCommandsModel>> execute({required Language language}) => usefulRepository.getUsefulCommands(language);
}
