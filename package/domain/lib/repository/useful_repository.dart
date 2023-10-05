import 'package:data/data.dart';

abstract class UsefulRepository {
  Stream<List<UsefulCommandsDTO>> getUsefulCommands(String localization);
}
