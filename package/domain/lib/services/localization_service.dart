import 'package:injectable/injectable.dart';

@singleton
class LocalizationService {
  var _locale = 'en';

  String get locale => this._locale;

  void set locale(String locale) => this._locale = locale;
}
