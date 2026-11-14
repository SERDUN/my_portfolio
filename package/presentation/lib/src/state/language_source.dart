import 'dart:async';

import 'package:domain/domain.dart';

/// What a page cubit needs to know about the content language: what it is
/// now, and when it changes. Keeps page cubits independent of the settings
/// cubit (and of theme state).
abstract interface class LanguageSource {
  Language get language;

  /// Every change after the moment of listening; repeats of the current
  /// language are skipped, separately for each listener.
  Stream<Language> get languageChanges;
}

/// Builds [LanguageSource.languageChanges] from a stream of languages that
/// may repeat. The last value is tracked per listener, so two listeners on
/// one returned stream never filter each other's events.
Stream<Language> distinctLanguageChanges(Language Function() current, Stream<Language> source) {
  return Stream.multi((controller) {
    var last = current();
    final subscription = source.listen(
      (language) {
        if (language == last) return;
        last = language;
        controller.add(language);
      },
      onError: controller.addError,
      onDone: controller.close,
    );
    controller.onCancel = subscription.cancel;
  }, isBroadcast: true);
}
