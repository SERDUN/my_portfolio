// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:data/datasource/api_datasource.dart' as _i420;
import 'package:data/datasource/assets_data_source.dart' as _i882;
import 'package:data/datasource/datasource.dart' as _i822;
import 'package:data/di/injection.dart' as _i237;
import 'package:data/repository/project_repository_impl.dart' as _i851;
import 'package:data/repository/useful_repository_impl.dart' as _i390;
import 'package:data/repository/user_repository_impl.dart' as _i320;
import 'package:domain/repository/repository.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final registerModule = _$RegisterModule();
    gh.singleton<_i882.AssetsDataSource>(() => _i882.AssetsDataSource());
    gh.factory<bool>(
      () => registerModule.hasServerSync,
      instanceName: 'hasServerSync',
    );
    gh.factory<String>(
      () => registerModule.userId,
      instanceName: 'userId',
    );
    gh.factory<bool>(
      () => registerModule.hasLocalSync,
      instanceName: 'hasLocalSync',
    );
    gh.factory<Uri>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.factory<_i420.ApiDatasource>(() => _i420.ApiDatasource(
          userId: gh<String>(instanceName: 'userId'),
          baseUrl: gh<Uri>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i174.UsefulRepository>(() => _i390.UsefulRepositoryImpl(
          gh<bool>(instanceName: 'hasServerSync'),
          gh<bool>(instanceName: 'hasLocalSync'),
          gh<_i822.AssetsDataSource>(),
          gh<_i822.ApiDatasource>(),
        ));
    gh.factory<_i174.ProjectRepository>(() => _i851.ProjectRepositoryImpl(
          gh<bool>(instanceName: 'hasServerSync'),
          gh<bool>(instanceName: 'hasLocalSync'),
          gh<_i822.AssetsDataSource>(),
          gh<_i822.ApiDatasource>(),
        ));
    gh.factory<_i174.UserRepository>(() => _i320.UserRepositoryImpl(
          gh<bool>(instanceName: 'hasServerSync'),
          gh<bool>(instanceName: 'hasLocalSync'),
          gh<_i822.AssetsDataSource>(),
          gh<_i822.ApiDatasource>(),
        ));
  }
}

class _$RegisterModule extends _i237.RegisterModule {}
