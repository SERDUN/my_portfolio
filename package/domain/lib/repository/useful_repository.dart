import '../common/common.dart';
import '../entity/model/model.dart';

/// The owner's command cheat sheet.
abstract class UsefulRepository {
  /// Command groups in [language].
  Stream<List<UsefulCommandsModel>> getUsefulCommands(Language language);
}
