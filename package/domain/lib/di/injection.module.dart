//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/common/mapper_contract.dart' as _i3;
import 'package:domain/entity/dto/contacts_dto.dart' as _i4;
import 'package:domain/entity/dto/portfolio_skills_dto.dart' as _i10;
import 'package:domain/entity/dto/portfolio_user_dto.dart' as _i23;
import 'package:domain/entity/dto/project_dto.dart' as _i26;
import 'package:domain/entity/dto/project_image_dto.dart' as _i7;
import 'package:domain/entity/dto/project_media_dto.dart' as _i16;
import 'package:domain/entity/dto/project_tags_dto.dart' as _i13;
import 'package:domain/entity/mapper/contact_mapper.dart' as _i6;
import 'package:domain/entity/mapper/portfolio_skills_mapper.dart' as _i12;
import 'package:domain/entity/mapper/portfolio_user_mapper.dart' as _i25;
import 'package:domain/entity/mapper/project_image_mapper.dart' as _i9;
import 'package:domain/entity/mapper/project_mapper.dart' as _i28;
import 'package:domain/entity/mapper/project_media_mapper.dart' as _i18;
import 'package:domain/entity/mapper/project_tags_mapper.dart' as _i15;
import 'package:domain/entity/model/contacts_model.dart' as _i5;
import 'package:domain/entity/model/portfolio_skills_model.dart' as _i11;
import 'package:domain/entity/model/portfolio_user_model.dart' as _i24;
import 'package:domain/entity/model/project_image_model.dart' as _i8;
import 'package:domain/entity/model/project_media_model.dart' as _i17;
import 'package:domain/entity/model/project_model.dart' as _i27;
import 'package:domain/entity/model/project_tags_model.dart' as _i14;
import 'package:domain/repository/project_repository.dart' as _i30;
import 'package:domain/repository/setting_repository.dart' as _i20;
import 'package:domain/repository/user_repository.dart' as _i22;
import 'package:domain/usecase/get_contacts_use_case.dart' as _i21;
import 'package:domain/usecase/get_project_by_id_use_case.dart' as _i29;
import 'package:domain/usecase/get_projects_use_case.dart' as _i31;
import 'package:domain/usecase/get_user_use_case.dart' as _i32;
import 'package:domain/usecase/update_local_config_use_case.dart' as _i19;
import 'package:injectable/injectable.dart' as _i1;

class DomainPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.Mapper<_i4.ContactsDTO, _i5.ContactsModel>>(
        () => _i6.ContactMapper());
    gh.factory<_i3.Mapper<_i7.ProjectImageDTO, _i8.ProjectImageModel>>(
        () => _i9.ProjectImageMapper());
    gh.factory<_i3.Mapper<_i10.PortfolioSkillsDTO, _i11.PortfolioSkillsModel>>(
        () => _i12.PortfolioSkillsMapper());
    gh.factory<_i3.Mapper<_i13.ProjectTagsDTO, _i14.ProjectTagsModel>>(
        () => _i15.ProjectTagsMapper());
    gh.factory<_i3.Mapper<_i16.ProjectMediaDTO, _i17.ProjectMediaModel>>(() =>
        _i18.ProjectMediaMapper(
            gh<_i3.Mapper<_i7.ProjectImageDTO, _i8.ProjectImageModel>>()));
    gh.factory<_i19.UpdateLocalConfigUseCase>(
        () => _i19.UpdateLocalConfigUseCaseImpl(gh<_i20.ConfigRepository>()));
    gh.factory<_i21.GetContactsUseCase>(() => _i21.GetContactsUseCaseImpl(
          gh<_i22.UserRepository>(),
          gh<_i3.Mapper<_i4.ContactsDTO, _i5.ContactsModel>>(),
        ));
    gh.factory<_i3.Mapper<_i23.PortfolioUserDTO, _i24.PortfolioUserModel>>(() =>
        _i25.PortfolioUserMapper(gh<
            _i3.Mapper<_i10.PortfolioSkillsDTO, _i11.PortfolioSkillsModel>>()));
    gh.factory<_i3.Mapper<_i26.ProjectDTO, _i27.ProjectModel>>(
        () => _i28.ProjectMapper(
              gh<_i3.Mapper<_i13.ProjectTagsDTO, _i14.ProjectTagsModel>>(),
              gh<_i3.Mapper<_i16.ProjectMediaDTO, _i17.ProjectMediaModel>>(),
            ));
    gh.factory<_i29.GetProjectByIdUseCase>(() => _i29.GetProjectByIdUseCaseImpl(
          gh<_i30.ProjectRepository>(),
          gh<_i3.Mapper<_i26.ProjectDTO, _i27.ProjectModel>>(),
        ));
    gh.factory<_i31.GetProjectsUseCase>(() => _i31.GetProjectsUseCaseImpl(
          gh<_i30.ProjectRepository>(),
          gh<_i3.Mapper<_i26.ProjectDTO, _i27.ProjectModel>>(),
        ));
    gh.factory<_i32.GetUserUseCase>(() => _i32.GetUserUseCaseImpl(
          gh<_i22.UserRepository>(),
          gh<_i3.Mapper<_i23.PortfolioUserDTO, _i24.PortfolioUserModel>>(),
        ));
  }
}
