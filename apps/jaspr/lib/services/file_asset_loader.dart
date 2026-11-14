import 'dart:io';

import 'package:data/data.dart';

/// Reads package/data's bundled content from disk for the pre-render pass,
/// which runs on the Dart VM at build time. Server-only: `dart:io` must never
/// reach the browser bundle, so only server entrypoints import this file.
class FileAssetLoader implements AssetLoader {
  /// [dataPackageRoot] is the directory of package/data, which the paths an
  /// [AssetLoader] is asked for are relative to.
  const FileAssetLoader(this.dataPackageRoot);

  final String dataPackageRoot;

  @override
  Future<String> loadString(String path) => File('$dataPackageRoot/$path').readAsString();
}
