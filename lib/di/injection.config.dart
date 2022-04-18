// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../layers/data/datasource/local/assets_data_source.dart' as _i3;
import '../layers/data/repository/project_repository_impl.dart' as _i18;
import '../layers/data/repository/user_repository_impl.dart' as _i20;
import '../layers/domain/common/mapper_contract.dart' as _i4;
import '../layers/domain/entity/dto/portfolio_skills_dto.dart' as _i14;
import '../layers/domain/entity/dto/portfolio_user_dto.dart' as _i24;
import '../layers/domain/entity/dto/project_dto.dart' as _i21;
import '../layers/domain/entity/dto/project_image_dto.dart' as _i5;
import '../layers/domain/entity/dto/project_media_dto.dart' as _i11;
import '../layers/domain/entity/dto/project_tags_dto.dart' as _i8;
import '../layers/domain/entity/mapper/projects/project_image_mapper.dart'
    as _i7;
import '../layers/domain/entity/mapper/projects/project_mapper.dart' as _i23;
import '../layers/domain/entity/mapper/projects/project_media_mapper.dart'
    as _i13;
import '../layers/domain/entity/mapper/projects/project_tags_mapper.dart'
    as _i10;
import '../layers/domain/entity/mapper/user/portfolio_skills_mapper.dart'
    as _i16;
import '../layers/domain/entity/mapper/user/portfolio_user_mapper.dart' as _i26;
import '../layers/domain/entity/model/projects/project_image_model.dart' as _i6;
import '../layers/domain/entity/model/projects/project_media_model.dart'
    as _i12;
import '../layers/domain/entity/model/projects/project_model.dart' as _i22;
import '../layers/domain/entity/model/projects/project_tags_model.dart' as _i9;
import '../layers/domain/entity/model/user/portfolio_skills_model.dart' as _i15;
import '../layers/domain/entity/model/user/portfolio_user_model.dart' as _i25;
import '../layers/domain/repository/project_repository.dart' as _i17;
import '../layers/domain/repository/user_repository.dart' as _i19;
import '../layers/domain/usecase/projects/get_project_by_id_use_case.dart'
    as _i27;
import '../layers/domain/usecase/projects/get_projects_use_case.dart' as _i28;
import '../layers/domain/usecase/user/get_user_use_case.dart'
    as _i29; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AssetsDataSource>(_i3.AssetsDataSource());
  gh.factory<_i4.Mapper<_i5.ProjectImageDTO, _i6.ProjectImageModel>>(
      () => _i7.ProjectImageMapper());
  gh.factory<_i4.Mapper<_i8.ProjectTagsDTO, _i9.ProjectTagsModel>>(
      () => _i10.ProjectTagsMapper());
  gh.factory<_i4.Mapper<_i11.ProjectMediaDTO, _i12.ProjectMediaModel>>(() =>
      _i13.ProjectMediaMapper(
          get<_i4.Mapper<_i5.ProjectImageDTO, _i6.ProjectImageModel>>()));
  gh.factory<_i4.Mapper<_i14.PortfolioSkillsDTO, _i15.PortfolioSkillsModel>>(
      () => _i16.PortfolioSkillsMapper());
  gh.factory<_i17.ProjectRepository>(
      () => _i18.ProjectRepositoryImpl(get<_i3.AssetsDataSource>()));
  gh.factory<_i19.UserRepository>(
      () => _i20.UserRepositoryImpl(get<_i3.AssetsDataSource>()));
  gh.factory<_i4.Mapper<_i21.ProjectDTO, _i22.ProjectModel>>(() =>
      _i23.ProjectMapper(
          get<_i4.Mapper<_i8.ProjectTagsDTO, _i9.ProjectTagsModel>>(),
          get<_i4.Mapper<_i11.ProjectMediaDTO, _i12.ProjectMediaModel>>()));
  gh.factory<_i4.Mapper<_i24.PortfolioUserDTO, _i25.PortfolioUserModel>>(() =>
      _i26.PortfolioUserMapper(get<
          _i4.Mapper<_i14.PortfolioSkillsDTO, _i15.PortfolioSkillsModel>>()));
  gh.factory<_i27.GetProjectByIdUseCase>(() => _i27.GetProjectByIdUseCase(
      get<_i17.ProjectRepository>(),
      get<_i4.Mapper<_i21.ProjectDTO, _i22.ProjectModel>>()));
  gh.factory<_i28.GetProjectsUseCase>(() => _i28.GetProjectsUseCase(
      get<_i17.ProjectRepository>(),
      get<_i4.Mapper<_i21.ProjectDTO, _i22.ProjectModel>>()));
  gh.factory<_i29.GetUserUseCase>(() => _i29.GetUserUseCase(
      get<_i19.UserRepository>(),
      get<_i4.Mapper<_i24.PortfolioUserDTO, _i25.PortfolioUserModel>>()));
  return get;
}