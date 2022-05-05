import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/default_error.dart';
import 'package:my_portfolio/layers/domain/repository/setting_repository.dart';

import '../../common/base_use_case.dart';
import '../../entity/model/error/common/either.dart';
import '../../entity/model/error/common/failure.dart';

@Injectable()
class UpdateLocalConfigUseCase extends BaseUseCase<String, void> {
  final ConfigRepository configRepository;

  UpdateLocalConfigUseCase(
    this.configRepository,
  );

  @override
  Future<Either<Failure, void>> execute({String? argument}) async {
    if (argument != null) {
      configRepository.updateSelectedLanguage(argument);
    } else {
      return Future.value(Left(DefaultFailure("Project id cannot be missing")));
    }
    return Future.value(Right(null));
  }
}
