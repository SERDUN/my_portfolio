import 'package:flutter/widgets.dart';

class LanguageNotifier with ChangeNotifier {
  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  void changeLanguage(Locale newLocale) {
    _currentLocale = newLocale;
    notifyListeners();
  }
}
