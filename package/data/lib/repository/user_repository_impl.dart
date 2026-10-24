import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';
import '../extension/extension.dart';

/// Serves the owner's profile, skills and contacts from whichever
/// [PortfolioDataSource] the environment bound.
@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.source);

  final PortfolioDataSource source;

  @override
  Stream<PortfolioUserModel> getUser(Language language) async* {
    yield (await source.getUser(language)).toDomain();
  }

  @override
  Stream<List<ContactsModel>> getContacts(Language language) async* {
    yield (await source.getContacts(language)).toDomain();
  }

  @override
  Stream<List<PortfolioSkillsModel>> getSkills(Language language) async* {
    yield (await source.getSkills(language)).toDomain();
  }
}
