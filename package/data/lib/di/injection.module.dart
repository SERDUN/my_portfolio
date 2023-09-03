//@GeneratedMicroModule;DataPackageModule;package:data/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data/datasource/datasource.dart' as _i8;
import 'package:data/datasource/local/assets_data_source.dart' as _i4;
import 'package:data/datasource/local/memory_data_source.dart' as _i5;
import 'package:data/datasource/remote/api_datasource.dart' as _i3;
import 'package:data/repository/project_repository_impl.dart' as _i7;
import 'package:data/repository/setting_repository_impl.dart' as _i10;
import 'package:data/repository/user_repository_impl.dart' as _i9;
import 'package:domain/domain.dart' as _i6;
import 'package:injectable/injectable.dart' as _i1;

class DataPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.ApiDatasource>(() => _i3.ApiDatasource(
          userId: gh<String>(instanceName: 'userId'),
          baseUrl: gh<Uri>(instanceName: 'baseUrl'),
        ));
    gh.singleton<_i4.AssetsDataSource>(_i4.AssetsDataSource());
    gh.singleton<_i5.MemoryDataSource>(_i5.MemoryDataSource());
    gh.factory<_i6.ProjectRepository>(() => _i7.ProjectRepositoryImpl(
          gh<_i8.AssetsDataSource>(),
          gh<_i8.ApiDatasource>(),
        ));
    gh.factory<_i6.UserRepository>(() => _i9.UserRepositoryImpl(
          gh<_i8.AssetsDataSource>(),
          gh<_i8.ApiDatasource>(),
        ));
    gh.factory<_i6.ConfigRepository>(
        () => _i10.SettingRepositoryImpl(gh<_i8.MemoryDataSource>()));
  }
}
