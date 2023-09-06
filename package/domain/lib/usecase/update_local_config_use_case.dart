import 'package:domain/services/services.dart';
import 'package:injectable/injectable.dart';

import '../repository/setting_repository.dart';

abstract class UpdateLocalConfigUseCase {
  Future execute();
}

@Injectable(as: UpdateLocalConfigUseCase)
class UpdateLocalConfigUseCaseImpl implements UpdateLocalConfigUseCase {
  UpdateLocalConfigUseCaseImpl(
    this.localizationService,
    this.configRepository,
  );

  final LocalizationService localizationService;
  final ConfigRepository configRepository;

  @override
  Future execute() async {
    return configRepository.updateSelectedLanguage(localizationService.locale);
  }
}
