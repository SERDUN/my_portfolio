import 'package:domain/domain.dart';

abstract class UsefulRepository {
  Stream<List<UsefulCommandsDTO>> getUsefulCommands(String localization);
}
