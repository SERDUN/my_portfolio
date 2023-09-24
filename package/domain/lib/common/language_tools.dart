import 'package:collection/collection.dart';

class LanguageTools {
  static const List<String> availableLanguages = [
    'en',
    'uk',
  ];

  static const String defaultLanguage = 'en';

  static bool isAvailableLanguage(String locale) {
    return availableLanguages.contains(locale);
  }

  static String normalizeLanguage(String locale) {
    return availableLanguages.firstWhereOrNull((element) => element == locale) ?? defaultLanguage;
  }

  static String checkLocale(
    String locale, {
    required Map<String, Function> languageFunctions,
  }) {
    if (isAvailableLanguage(locale)) {
      return languageFunctions[locale]!();
    }

    return languageFunctions[defaultLanguage]!();
  }
}
