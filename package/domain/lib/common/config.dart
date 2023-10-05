import 'package:domain/common/language_tools.dart';
import 'package:injectable/injectable.dart';

@singleton
class Config {
  String _currentLocale = 'en';

  String get currentLocale => _currentLocale;

  void set setCurrentLocale(String locale) => _currentLocale = LanguageTools.normalizeLanguage(locale);
}
