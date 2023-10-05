import 'dart:async';

extension StreamControllerExtension on StreamController {
  Future addFuture(
    Future future, {
    bool? cancelOnError,
  }) =>
      addStream(future.asStream(), cancelOnError: cancelOnError);
}
