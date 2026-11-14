import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

/// Logs every error a cubit reports through `addError`, including the
/// secondary streams whose failures never reach the UI.
class LoggingBlocObserver extends BlocObserver {
  const LoggingBlocObserver();

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    developer.log('${bloc.runtimeType} failed', name: 'bloc', error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
