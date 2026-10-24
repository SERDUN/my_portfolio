import 'dart:async';

import 'package:bloc/bloc.dart';

/// Keyed stream subscriptions for a cubit. Re-subscribing under a key
/// cancels the previous one, data after [Cubit.close] is dropped, and every
/// error reaches [Cubit.addError] (so the app's BlocObserver logs it) before
/// the cubit's own `onError` turns it into state. Never an unhandled error.
mixin CubitSubscriptions<S> on Cubit<S> {
  final Map<Object, StreamSubscription<Object?>> _subscriptions = {};

  void subscribe<T>(
    Object key,
    Stream<T> stream, {
    required void Function(T data) onData,
    void Function(Object error, StackTrace stackTrace)? onError,
  }) {
    _subscriptions.remove(key)?.cancel();
    _subscriptions[key] = stream.listen(
      (data) {
        if (!isClosed) onData(data);
      },
      onError: (Object error, StackTrace stackTrace) {
        if (isClosed) return;
        addError(error, stackTrace);
        onError?.call(error, stackTrace);
      },
    );
  }

  /// The one loading skeleton every page cubit uses: emit [loading] now,
  /// then [success] with the data or [failure] with the error.
  void loadPrimary<T>(
    Object key,
    Stream<T> stream, {
    required S loading,
    required S Function(T data) success,
    required S Function(Object error) failure,
  }) {
    emit(loading);
    subscribe(key, stream, onData: (data) => emit(success(data)), onError: (error, _) => emit(failure(error)));
  }

  @override
  Future<void> close() async {
    final pending = _subscriptions.values.map((s) => s.cancel()).toList();
    _subscriptions.clear();
    await Future.wait(pending);
    return super.close();
  }
}
