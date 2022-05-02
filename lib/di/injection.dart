import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

late GetIt di;

@injectableInit
Future configureDependencies(String environment) async {
  di = GetIt.asNewInstance();
  $initGetIt(di, environment: environment);
}
