import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

late GetIt di;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(DataPackageModule),
    ExternalModule(DomainPackageModule),
  ],
)
Future configureDependencies(String environment) async {
  di = GetIt.asNewInstance();
  di.init();
}

@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("baseUrl")
  Uri get baseUrl => Uri.parse('http://127.0.0.1:7982/portfolio-f2eb7/us-central1/api/v1');

  @Named("userId")
  String get userId => 'R5KVoOkqVztd4uxKxTCt';
}
