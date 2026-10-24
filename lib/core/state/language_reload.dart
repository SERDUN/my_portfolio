import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

/// Calls [load] now and again whenever [notifier] changes, and stops when
/// the cubit closes. The listener bookkeeping every page cubit used to copy.
mixin LanguageReload<S> on Cubit<S> {
  Listenable? _notifier;

  void load();

  void reloadOn(Listenable notifier) {
    _notifier = notifier;
    load();
    notifier.addListener(load);
  }

  @override
  Future<void> close() {
    _notifier?.removeListener(load);
    return super.close();
  }
}
