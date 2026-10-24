import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';
import '../extension/extension.dart';

/// Serves the command cheat sheet from the bundled assets. The API has no
/// endpoint for it, so there is no server source to toggle.
@Injectable(as: UsefulRepository)
class UsefulRepositoryImpl implements UsefulRepository {
  UsefulRepositoryImpl(this.assetDataSource);

  final AssetsDataSource assetDataSource;

  @override
  Stream<List<UsefulCommandsModel>> getUsefulCommands(Language language) async* {
    yield (await assetDataSource.getUsefulCommand(language)).toDomain();
  }
}
