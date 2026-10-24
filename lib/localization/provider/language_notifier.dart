import 'package:flutter/widgets.dart';

import 'package:domain/domain.dart';

/// The UI language. Holds a bare language-code [Locale]; cubits read
/// [language] when they ask a use case for data and re-read on change.
class LanguageNotifier with ChangeNotifier {
  Locale _currentLocale = Locale(Language.fallback.code);

  Locale get currentLocale => _currentLocale;

  /// The language use cases expect, resolved once here.
  Language get language => Language.fromCode(_currentLocale.languageCode);

  /// Keeps only the language code: `uk_UA` and `uk` are the same choice.
  void changeLanguage(Locale newLocale) {
    final next = Locale(newLocale.languageCode);
    if (next == _currentLocale) return;
    _currentLocale = next;
    notifyListeners();
  }
}
