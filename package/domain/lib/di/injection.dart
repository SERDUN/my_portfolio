import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:data/di/injection.module.dart';

late GetIt di;

@InjectableInit.microPackage(
  externalPackageModulesBefore: [
    ExternalModule(DataPackageModule),
  ],
)
initMicroPackage() {}
