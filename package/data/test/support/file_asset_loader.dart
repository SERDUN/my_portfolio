import 'dart:io';

import 'package:data/data.dart';

/// Reads the bundled files from disk. `dart test` runs with the package root
/// as the working directory, which is what [AssetLoader] paths are relative to.
class FileAssetLoader implements AssetLoader {
  const FileAssetLoader();

  @override
  Future<String> loadString(String path) => File(path).readAsString();
}
