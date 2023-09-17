import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'injection.config.dart';

@InjectableInit(
  externalPackageModulesAfter: [
    ExternalModule(DomainPackageModule),
  ],
)
Future<GetIt> configureDependencies(String environment) async => GetIt.asNewInstance().init();

@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("baseUrl")
  Uri get baseUrl => Uri.parse('https://us-central1-portfolio-f2eb7.cloudfunctions.net/api/v1');

  @Named("userId")
  String get userId => 'R5KVoOkqVztd4uxKxTCt';

  @Named("hasServerSync")
  bool get hasServerSync => false;

  @Named("hasLocalSync")
  bool get hasLocalSync => true;
}
