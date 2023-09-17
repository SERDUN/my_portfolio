//@GeneratedMicroModule;DataPackageModule;package:data/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data/datasource/api_datasource.dart' as _i5;
import 'package:data/datasource/assets_data_source.dart' as _i3;
import 'package:data/datasource/datasource.dart' as _i8;
import 'package:data/datasource/memory_data_source.dart' as _i4;
import 'package:data/di/injection.dart' as _i11;
import 'package:data/repository/project_repository_impl.dart' as _i7;
import 'package:data/repository/useful_repository_impl.dart' as _i9;
import 'package:data/repository/user_repository_impl.dart' as _i10;
import 'package:domain/domain.dart' as _i6;
import 'package:injectable/injectable.dart' as _i1;

class DataPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AssetsDataSource>(_i3.AssetsDataSource());
    gh.singleton<_i4.MemoryDataSource>(_i4.MemoryDataSource());
    gh.factory<String>(
      () => registerModule.userId,
      instanceName: 'userId',
    );
    gh.factory<Uri>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.factory<bool>(
      () => registerModule.hasServerSync,
      instanceName: 'hasServerSync',
    );
    gh.factory<bool>(
      () => registerModule.hasLocalSync,
      instanceName: 'hasLocalSync',
    );
    gh.factory<_i5.ApiDatasource>(() => _i5.ApiDatasource(
          userId: gh<String>(instanceName: 'userId'),
          baseUrl: gh<Uri>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i6.ProjectRepository>(() => _i7.ProjectRepositoryImpl(
          gh<bool>(instanceName: 'hasServerSync'),
          gh<bool>(instanceName: 'hasLocalSync'),
          gh<_i8.AssetsDataSource>(),
          gh<_i8.ApiDatasource>(),
        ));
    gh.factory<_i6.UsefulRepository>(() => _i9.UsefulRepositoryImpl(
          gh<bool>(instanceName: 'hasServerSync'),
          gh<bool>(instanceName: 'hasLocalSync'),
          gh<_i8.AssetsDataSource>(),
          gh<_i8.ApiDatasource>(),
        ));
    gh.factory<_i6.UserRepository>(() => _i10.UserRepositoryImpl(
          gh<bool>(instanceName: 'hasServerSync'),
          gh<bool>(instanceName: 'hasLocalSync'),
          gh<_i8.AssetsDataSource>(),
          gh<_i8.ApiDatasource>(),
        ));
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
