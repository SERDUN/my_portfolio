import 'package:injectable/injectable.dart';

@singleton
class Config {
  String _currentLocale = 'en';

  List<String> _availableLanguage = ['en', 'uk'];

  String get currentLocale => _currentLocale;

  void set setCurrentLocale(String locale) {
    if (_availableLanguage.contains(locale)) {
      _currentLocale = locale;
    }
  }
}
