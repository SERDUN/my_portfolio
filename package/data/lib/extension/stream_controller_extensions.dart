import 'dart:async';

extension StreamControllerExtension on StreamController {
  void addFuture(
    Future future, {
    bool? cancelOnError,
  }) =>
      addStream(future.asStream(), cancelOnError: cancelOnError);
}
