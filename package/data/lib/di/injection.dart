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
  @Named('baseUrl')
  Uri get baseUrl => Uri.parse('https://us-central1-portfolio-f2eb7.cloudfunctions.net/api/v1');

  @Named('userId')
  String get userId => 'R5KVoOkqVztd4uxKxTCt';

  @Environment(DataEnvironment.assets)
  @lazySingleton
  PortfolioDataSource assetsSource(AssetsDataSource assets) => assets;

  @Environment(DataEnvironment.api)
  @lazySingleton
  PortfolioDataSource apiSource(ApiDatasource api, AssetsDataSource assets) =>
      FallbackDataSource(primary: api, fallback: assets);
}
