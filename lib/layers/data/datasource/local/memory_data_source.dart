import 'package:injectable/injectable.dart';

@Singleton()
class MemoryDataSource {
  String? language;

  MemoryDataSource();

  @Singleton()
  String? getCurrentLanguage() {
    return language;
  }

  @Singleton()
  void updateCurrentLanguage(String lang) {
    language = lang;
  }
}
