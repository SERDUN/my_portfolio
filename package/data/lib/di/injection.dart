import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

late GetIt di;

@InjectableInit.microPackage()
initMicroPackage() {}

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
