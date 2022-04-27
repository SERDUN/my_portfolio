// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../layers/data/datasource/local/assets_data_source.dart' as _i3;
import '../layers/data/repository/project_repository_impl.dart' as _i21;
import '../layers/data/repository/user_repository_impl.dart' as _i23;
import '../layers/domain/common/mapper_contract.dart' as _i4;
import '../layers/domain/entity/dto/contacts_dto.dart' as _i17;
import '../layers/domain/entity/dto/portfolio_skills_dto.dart' as _i14;
import '../layers/domain/entity/dto/portfolio_user_dto.dart' as _i28;
import '../layers/domain/entity/dto/project_dto.dart' as _i25;
import '../layers/domain/entity/dto/project_image_dto.dart' as _i5;
import '../layers/domain/entity/dto/project_media_dto.dart' as _i11;
import '../layers/domain/entity/dto/project_tags_dto.dart' as _i8;
import '../layers/domain/entity/mapper/contact/contact_mapper.dart' as _i19;
import '../layers/domain/entity/mapper/projects/project_image_mapper.dart'
    as _i7;
import '../layers/domain/entity/mapper/projects/project_mapper.dart' as _i27;
import '../layers/domain/entity/mapper/projects/project_media_mapper.dart'
    as _i13;
import '../layers/domain/entity/mapper/projects/project_tags_mapper.dart'
    as _i10;
import '../layers/domain/entity/mapper/user/portfolio_skills_mapper.dart'
    as _i16;
import '../layers/domain/entity/mapper/user/portfolio_user_mapper.dart' as _i30;
import '../layers/domain/entity/model/contact/contacts_model.dart' as _i18;
import '../layers/domain/entity/model/projects/project_image_model.dart' as _i6;
import '../layers/domain/entity/model/projects/project_media_model.dart'
    as _i12;
import '../layers/domain/entity/model/projects/project_model.dart' as _i26;
import '../layers/domain/entity/model/projects/project_tags_model.dart' as _i9;
import '../layers/domain/entity/model/user/portfolio_skills_model.dart' as _i15;
import '../layers/domain/entity/model/user/portfolio_user_model.dart' as _i29;
import '../layers/domain/repository/project_repository.dart' as _i20;
import '../layers/domain/repository/user_repository.dart' as _i22;
import '../layers/domain/usecase/contacts/get_contacts_use_case.dart' as _i24;
import '../layers/domain/usecase/projects/get_project_by_id_use_case.dart'
    as _i31;
import '../layers/domain/usecase/projects/get_projects_use_case.dart' as _i32;
import '../layers/domain/usecase/user/get_user_use_case.dart'
    as _i33; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i4.Mapper<_i17.ContactsDTO, _i18.ContactsModel>>(
      () => _i19.ContactMapper());
  gh.factory<_i20.ProjectRepository>(
      () => _i21.ProjectRepositoryImpl(get<_i3.AssetsDataSource>()));
  gh.factory<_i22.UserRepository>(
      () => _i23.UserRepositoryImpl(get<_i3.AssetsDataSource>()));
  gh.factory<_i24.GetContactsUseCase>(() => _i24.GetContactsUseCase(
      get<_i22.UserRepository>(),
      get<_i4.Mapper<_i17.ContactsDTO, _i18.ContactsModel>>()));
  gh.factory<_i4.Mapper<_i25.ProjectDTO, _i26.ProjectModel>>(() =>
      _i27.ProjectMapper(
          get<_i4.Mapper<_i8.ProjectTagsDTO, _i9.ProjectTagsModel>>(),
          get<_i4.Mapper<_i11.ProjectMediaDTO, _i12.ProjectMediaModel>>()));
  gh.factory<_i4.Mapper<_i28.PortfolioUserDTO, _i29.PortfolioUserModel>>(() =>
      _i30.PortfolioUserMapper(get<
          _i4.Mapper<_i14.PortfolioSkillsDTO, _i15.PortfolioSkillsModel>>()));
  gh.factory<_i31.GetProjectByIdUseCase>(() => _i31.GetProjectByIdUseCase(
      get<_i20.ProjectRepository>(),
      get<_i4.Mapper<_i25.ProjectDTO, _i26.ProjectModel>>()));
  gh.factory<_i32.GetProjectsUseCase>(() => _i32.GetProjectsUseCase(
      get<_i20.ProjectRepository>(),
      get<_i4.Mapper<_i25.ProjectDTO, _i26.ProjectModel>>()));
  gh.factory<_i33.GetUserUseCase>(() => _i33.GetUserUseCase(
      get<_i22.UserRepository>(),
      get<_i4.Mapper<_i28.PortfolioUserDTO, _i29.PortfolioUserModel>>()));
  return get;
}
