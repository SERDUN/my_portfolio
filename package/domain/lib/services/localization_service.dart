import 'package:injectable/injectable.dart';

@singleton
class LocalizationService {
  String _locale = 'en';

  String get locale => this._locale;

  void set locale(String locale) => this._locale = locale;
}
