import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../datasource/datasource.dart';
import 'environment.dart';

late GetIt di;

@InjectableInit.microPackage()
void initMicroPackage() {}

/// The single place that decides which [PortfolioDataSource] the
/// environment gets; the concrete sources are plain lazy singletons.
@module
abstract class RegisterModule {
  /// The content API (`server/`), from `--dart-define=API_URL=https://...`.
  /// Without it requests fail and the api environment answers from assets.
  @Named('baseUrl')
  Uri get baseUrl => Uri.parse('${const String.fromEnvironment('API_URL')}/v1');

  @Environment(DataEnvironment.assets)
  @lazySingleton
  PortfolioDataSource assetsSource(AssetsDataSource assets) => assets;

  @Environment(DataEnvironment.api)
  @lazySingleton
  PortfolioDataSource apiSource(ApiDatasource api, AssetsDataSource assets) =>
      FallbackDataSource(primary: api, fallback: assets);
}
