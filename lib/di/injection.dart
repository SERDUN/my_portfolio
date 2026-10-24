import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

import 'injection.config.dart';

@InjectableInit(
  // injectable 3 no longer discovers micro packages: list every module here.
  externalPackageModulesAfter: [ExternalModule(DataPackageModule), ExternalModule(DomainPackageModule)],
)
Future<GetIt> configureDependencies(String environment) async => GetIt.asNewInstance().init(environment: environment);
