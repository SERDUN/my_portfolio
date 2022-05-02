import 'package:injectable/injectable.dart';
import 'package:my_portfolio/layers/domain/entity/dto/contacts_dto.dart';
import 'package:my_portfolio/layers/domain/entity/dto/portfolio_user_dto.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/default_error.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/either.dart';
import 'package:my_portfolio/layers/domain/entity/model/error/common/failure.dart';

import '../../domain/repository/setting_repository.dart';
import '../../domain/repository/user_repository.dart';
import '../datasource/local/assets_data_source.dart';
import '../datasource/local/memory_data_source.dart';

// @Injectable(as: SettingRepository)
// class SettingRepositoryImpl extends SettingRepository {
//   // final MemoryDataSource source;
//
//   // SettingRepositoryImpl(this.source);
//
//   @override
//   String getSelectedLanguage() {
//     return "en";
//   }
//
//   @override
//   void updateSelectedLanguage(String localization) {
//     //   source.updateCurrentLanguage(localization);
//   }
// }
