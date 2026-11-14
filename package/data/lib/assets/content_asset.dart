import 'package:domain/domain.dart';

/// One JSON file of the bundled content, per language under
/// `assets/data/<language code>/`.
enum ContentAsset {
  contact('contact'),
  projects('projects'),
  skills('skills'),
  usefulCommands('useful_commands'),
  user('user');

  const ContentAsset(this.fileName);

  /// The file name without `.json`, as the content API's pull writes it.
  final String fileName;

  /// The path of this file for [language], relative to the root of this
  /// package: what an [AssetLoader] is asked for.
  String path(Language language) => 'assets/data/${language.code}/$fileName.json';
}

/// Reads one bundled file as text. The presenter supplies it: the Flutter app
/// reads its asset bundle, the Jaspr pre-render reads the file from disk, so
/// this package never depends on either.
abstract interface class AssetLoader {
  /// [path] is relative to the root of this package (`assets/data/en/user.json`).
  Future<String> loadString(String path);
}
