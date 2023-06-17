//@GeneratedMicroModule;DataPackageModule;package:data/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data/datasource/local/assets_data_source.dart' as _i3;
import 'package:data/datasource/local/memory_data_source.dart' as _i4;
import 'package:data/repository/project_repository_impl.dart' as _i6;
import 'package:data/repository/setting_repository_impl.dart' as _i8;
import 'package:data/repository/user_repository_impl.dart' as _i7;
import 'package:domain/repository/repository.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

class DataPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.singleton<_i3.AssetsDataSource>(_i3.AssetsDataSource());
    gh.singleton<_i4.MemoryDataSource>(_i4.MemoryDataSource());
    gh.factory<_i5.ProjectRepository>(
        () => _i6.ProjectRepositoryImpl(gh<_i3.AssetsDataSource>()));
    gh.factory<_i5.UserRepository>(
        () => _i7.UserRepositoryImpl(gh<_i3.AssetsDataSource>()));
    gh.factory<_i5.ConfigRepository>(
        () => _i8.SettingRepositoryImpl(gh<_i4.MemoryDataSource>()));
  }
}
