import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';
import '../extension/extension.dart';

/// Serves the command cheat sheet from the bundled assets in every
/// environment: the API has no endpoint for it.
@Injectable(as: UsefulRepository)
class UsefulRepositoryImpl implements UsefulRepository {
  UsefulRepositoryImpl(this.assetDataSource);

  final AssetsDataSource assetDataSource;

  @override
  Stream<List<UsefulCommandsModel>> getUsefulCommands(Language language) async* {
    yield (await assetDataSource.getUsefulCommand(language)).toDomain();
  }
}
