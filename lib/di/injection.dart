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
