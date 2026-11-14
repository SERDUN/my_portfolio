import 'package:flutter/services.dart';

import 'package:injectable/injectable.dart';

import 'package:data/data.dart';

/// Reads the content bundled by package/data from the app's asset bundle,
/// where the Flutter tool puts a package's assets under `packages/<name>/`.
@LazySingleton(as: AssetLoader)
class RootBundleAssetLoader implements AssetLoader {
  @override
  Future<String> loadString(String path) => rootBundle.loadString('packages/data/$path');
}
