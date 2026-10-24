import '../entity/model/model.dart';

/// The owner's command cheat sheet.
abstract class UsefulRepository {
  /// Command groups in [localization].
  Stream<List<UsefulCommandsModel>> getUsefulCommands(String localization);
}
