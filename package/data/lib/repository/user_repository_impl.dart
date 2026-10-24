import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';
import '../extension/extension.dart';

/// Serves the owner's profile, skills and contacts from the bundled assets
/// and, when enabled, refreshes them from the API afterwards. Each stream
/// completes after the last enabled source and errors when none is enabled.
@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
    @Named('hasServerSync') this.hasServerSync,
    @Named('hasLocalSync') this.hasLocalSync,
    this.assetDataSource,
    this.apiDatasource,
  );

  final ApiDatasource apiDatasource;
  final AssetsDataSource assetDataSource;

  final bool hasServerSync;
  final bool hasLocalSync;

  @override
  Stream<PortfolioUserModel> getUser(Language language) async* {
    _requireSource();
    if (hasLocalSync) yield (await assetDataSource.getUser(language)).toDomain();
    if (hasServerSync) yield (await apiDatasource.getUser(language)).toDomain();
  }

  @override
  Stream<List<ContactsModel>> getContacts(Language language) async* {
    _requireSource();
    if (hasLocalSync) yield (await assetDataSource.getContacts(language)).toDomain();
    if (hasServerSync) yield (await apiDatasource.getContacts(language)).toDomain();
  }

  @override
  Stream<List<PortfolioSkillsModel>> getSkills(Language language) async* {
    _requireSource();
    if (hasLocalSync) yield (await assetDataSource.getSkills(language)).toDomain();
    if (hasServerSync) yield (await apiDatasource.getSkills(language)).toDomain();
  }

  void _requireSource() {
    if (!hasLocalSync && !hasServerSync) throw StateError('UserRepositoryImpl has no data source enabled');
  }
}
