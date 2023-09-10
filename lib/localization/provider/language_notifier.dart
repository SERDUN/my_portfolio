import 'package:flutter/widgets.dart';

class LanguageNotifier with ChangeNotifier {
  LanguageNotifier(this.onUpdate);

  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  final Function(Locale locale) onUpdate;

  void changeLanguage(Locale newLocale) {
    _currentLocale = newLocale;
    onUpdate(newLocale);
    notifyListeners();
  }
}
