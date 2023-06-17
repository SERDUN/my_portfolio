import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../datasource/datasource.dart';

@Injectable(as: ConfigRepository)
class SettingRepositoryImpl extends ConfigRepository {
  final MemoryDataSource source;

  SettingRepositoryImpl(this.source);

  @override
  String getSelectedLanguage() {
    return source.language ?? "en";
  }

  @override
  void updateSelectedLanguage(String localization) {
    source.updateCurrentLanguage(localization);
  }
}
