import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';

import '../datasource/local/memory_data_source.dart';

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
