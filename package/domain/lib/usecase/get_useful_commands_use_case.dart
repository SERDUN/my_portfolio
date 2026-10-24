import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// Command groups of the cheat sheet in the current locale.
abstract class GetUsefulCommandsUseCase {
  Stream<List<UsefulCommandsModel>> execute();
}

@Injectable(as: GetUsefulCommandsUseCase)
class GetUsefulCommandsUseCaseImpl implements GetUsefulCommandsUseCase {
  GetUsefulCommandsUseCaseImpl(this.config, this.usefulRepository);

  final Config config;
  final UsefulRepository usefulRepository;

  @override
  Stream<List<UsefulCommandsModel>> execute() => usefulRepository.getUsefulCommands(config.currentLocale);
}
