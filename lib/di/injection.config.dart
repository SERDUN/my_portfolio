// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../layers/data/datasource/local/assets_data_source.dart' as _i3;
import '../layers/data/repository/user_repository_impl.dart' as _i9;
import '../layers/domain/common/mapper_contract.dart' as _i4;
import '../layers/domain/entity/dto/portfolio_skills_dto.dart' as _i5;
import '../layers/domain/entity/dto/portfolio_user_dto.dart' as _i10;
import '../layers/domain/entity/mapper/portfolio_skills_mapper.dart' as _i7;
import '../layers/domain/entity/mapper/portfolio_user_mapper.dart' as _i12;
import '../layers/domain/entity/model/user/portfolio_skills_model.dart' as _i6;
import '../layers/domain/entity/model/user/portfolio_user_model.dart' as _i11;
import '../layers/domain/repository/user_repository.dart' as _i8;
import '../layers/domain/usecase/get_user_use_case.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AssetsDataSource>(_i3.AssetsDataSource());
  gh.factory<_i4.Mapper<_i5.PortfolioSkillsDTO, _i6.PortfolioSkillsModel>>(
      () => _i7.PortfolioSkillsMapper());
  gh.factory<_i8.UserRepository>(
      () => _i9.UserRepositoryImpl(get<_i3.AssetsDataSource>()));
  gh.factory<_i4.Mapper<_i10.PortfolioUserDTO, _i11.PortfolioUserModel>>(() =>
      _i12.PortfolioUserMapper(
          get<_i4.Mapper<_i5.PortfolioSkillsDTO, _i6.PortfolioSkillsModel>>()));
  gh.factory<_i13.GetUserUseCase>(() => _i13.GetUserUseCase(
      get<_i8.UserRepository>(),
      get<_i4.Mapper<_i10.PortfolioUserDTO, _i11.PortfolioUserModel>>()));
  return get;
}
