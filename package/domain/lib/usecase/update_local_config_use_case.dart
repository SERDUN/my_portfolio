import 'package:injectable/injectable.dart';

import '../repository/setting_repository.dart';

abstract class UpdateLocalConfigUseCase {
  Future execute({
    String? language,
  });
}

@Injectable(as: UpdateLocalConfigUseCase)
class UpdateLocalConfigUseCaseImpl implements UpdateLocalConfigUseCase {
  final ConfigRepository configRepository;

  UpdateLocalConfigUseCaseImpl(
    this.configRepository,
  );

  @override
  Future execute({String? language}) async {
    return configRepository.updateSelectedLanguage(language!);
  }
}
