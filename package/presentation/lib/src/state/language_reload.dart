import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'language_source.dart';

/// Calls [load] now and again whenever the content language changes, and
/// stops when the cubit closes. Page cubits read [language] inside [load] so
/// every stream of one load asks for the same language.
mixin LanguageReload<S> on Cubit<S> {
  StreamSubscription<Language>? _languageSubscription;
  late Language _language;

  Language get language => _language;

  void load();

  /// Reads the current language and subscribes to its changes in one step,
  /// so nothing can change in between. Repeats are filtered by the source.
  void reloadOn(LanguageSource source) {
    _language = source.language;
    _languageSubscription = source.languageChanges.listen((language) {
      if (isClosed) return;
      _language = language;
      load();
    });
    load();
  }

  @override
  Future<void> close() {
    // Cancel synchronously so no reload can start once closing has begun.
    _languageSubscription?.cancel();
    return super.close();
  }
}
