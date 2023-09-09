import 'dart:async';

extension StreamControllerExtension on StreamController {
  void addFuture(
    Future future, {
    bool? cancelOnError,
    bool ignore = false,
  }) {
    if (!ignore) addStream(future.asStream(), cancelOnError: cancelOnError);
  }
}
