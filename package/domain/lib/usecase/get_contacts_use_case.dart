import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// Contact channels in the current locale.
abstract class GetContactsUseCase {
  Stream<List<ContactsModel>> execute();
}

@Injectable(as: GetContactsUseCase)
class GetContactsUseCaseImpl implements GetContactsUseCase {
  GetContactsUseCaseImpl(this.config, this.userRepository);

  final Config config;
  final UserRepository userRepository;

  @override
  Stream<List<ContactsModel>> execute() => userRepository.getContacts(config.currentLocale);
}
