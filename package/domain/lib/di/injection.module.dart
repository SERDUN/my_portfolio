//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data/data.dart' as _i5;
import 'package:domain/common/common.dart' as _i12;
import 'package:domain/common/config.dart' as _i3;
import 'package:domain/common/mapper_contract.dart' as _i4;
import 'package:domain/entity/entity.dart' as _i13;
import 'package:domain/entity/mapper/contact_mapper.dart' as _i9;
import 'package:domain/entity/mapper/portfolio_skills_mapper.dart' as _i11;
import 'package:domain/entity/mapper/portfolio_user_mapper.dart' as _i16;
import 'package:domain/entity/mapper/project_mapper.dart' as _i7;
import 'package:domain/entity/mapper/useful_commands_mapper.dart' as _i14;
import 'package:domain/entity/model/contacts_model.dart' as _i8;
import 'package:domain/entity/model/portfolio_skills_model.dart' as _i10;
import 'package:domain/entity/model/portfolio_user_model.dart' as _i15;
import 'package:domain/entity/model/project_model.dart' as _i6;
import 'package:domain/repository/repository.dart' as _i18;
import 'package:domain/usecase/get_contacts_use_case.dart' as _i17;
import 'package:domain/usecase/get_project_by_id_use_case.dart' as _i19;
import 'package:domain/usecase/get_projects_use_case.dart' as _i20;
import 'package:domain/usecase/get_useful_commands_use_case.dart' as _i21;
import 'package:domain/usecase/get_user_skills_use_case.dart' as _i22;
import 'package:domain/usecase/get_user_use_case.dart' as _i23;
import 'package:injectable/injectable.dart' as _i1;

class DomainPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.singleton<_i3.Config>(_i3.Config());
    gh.factory<_i4.Mapper<_i5.ProjectDTO, _i6.ProjectModel>>(
        () => _i7.ProjectMapper());
    gh.factory<_i4.Mapper<_i5.ContactsDTO, _i8.ContactsModel>>(
        () => _i9.ContactMapper());
    gh.factory<_i4.Mapper<_i5.PortfolioSkillsDTO, _i10.PortfolioSkillsModel>>(
        () => _i11.PortfolioSkillsMapper());
    gh.factory<_i12.Mapper<_i5.UsefulCommandsDTO, _i13.UsefulCommandsModel>>(
        () => _i14.UsefulCommandsMapper());
    gh.factory<_i4.Mapper<_i5.PortfolioUserDTO, _i15.PortfolioUserModel>>(() =>
        _i16.PortfolioUserMapper(gh<
            _i4.Mapper<_i5.PortfolioSkillsDTO, _i10.PortfolioSkillsModel>>()));
    gh.factory<_i17.GetContactsUseCase>(() => _i17.GetContactsUseCaseImpl(
          gh<_i12.Config>(),
          gh<_i18.UserRepository>(),
          gh<_i12.Mapper<_i5.ContactsDTO, _i13.ContactsModel>>(),
        ));
    gh.factory<_i19.GetProjectByIdUseCase>(() => _i19.GetProjectByIdUseCaseImpl(
          gh<_i12.Config>(),
          gh<_i18.ProjectRepository>(),
          gh<_i12.Mapper<_i5.ProjectDTO, _i13.ProjectModel>>(),
        ));
    gh.factory<_i20.GetProjectsUseCase>(() => _i20.GetProjectsUseCaseImpl(
          gh<_i12.Config>(),
          gh<_i18.ProjectRepository>(),
          gh<_i12.Mapper<_i5.ProjectDTO, _i13.ProjectModel>>(),
        ));
    gh.factory<_i21.GetUsefulCommandsUseCase>(() =>
        _i21.GetUsefulCommandsUseCaseImpl(
          gh<_i12.Config>(),
          gh<_i18.UsefulRepository>(),
          gh<_i12.Mapper<_i5.UsefulCommandsDTO, _i13.UsefulCommandsModel>>(),
        ));
    gh.factory<_i22.GetUserSkillsUseCase>(() => _i22.GetUserUseCaseSkillsImpl(
          gh<_i12.Config>(),
          gh<_i18.UserRepository>(),
          gh<_i12.Mapper<_i5.PortfolioSkillsDTO, _i13.PortfolioSkillsModel>>(),
        ));
    gh.factory<_i23.GetUserUseCase>(() => _i23.GetUserUseCaseImpl(
          gh<_i12.Config>(),
          gh<_i18.UserRepository>(),
          gh<_i12.Mapper<_i5.PortfolioUserDTO, _i13.PortfolioUserModel>>(),
        ));
  }
}
