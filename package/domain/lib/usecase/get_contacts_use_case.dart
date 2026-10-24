import 'package:injectable/injectable.dart';

import '../common/common.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

/// Contact channels.
abstract class GetContactsUseCase {
  Stream<List<ContactsModel>> execute({required Language language});
}

@Injectable(as: GetContactsUseCase)
class GetContactsUseCaseImpl implements GetContactsUseCase {
  GetContactsUseCaseImpl(this.userRepository);

  final UserRepository userRepository;

  @override
  Stream<List<ContactsModel>> execute({required Language language}) => userRepository.getContacts(language);
}
