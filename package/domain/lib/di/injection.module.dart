//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/common/mapper_contract.dart' as _i3;
import 'package:domain/domain.dart' as _i21;
import 'package:domain/entity/dto/contacts_dto.dart' as _i7;
import 'package:domain/entity/dto/portfolio_skills_dto.dart' as _i10;
import 'package:domain/entity/dto/portfolio_user_dto.dart' as _i22;
import 'package:domain/entity/dto/project_dto.dart' as _i4;
import 'package:domain/entity/mapper/contact_mapper.dart' as _i9;
import 'package:domain/entity/mapper/portfolio_skills_mapper.dart' as _i12;
import 'package:domain/entity/mapper/portfolio_user_mapper.dart' as _i24;
import 'package:domain/entity/mapper/project_mapper.dart' as _i6;
import 'package:domain/entity/model/contacts_model.dart' as _i8;
import 'package:domain/entity/model/portfolio_skills_model.dart' as _i11;
import 'package:domain/entity/model/portfolio_user_model.dart' as _i23;
import 'package:domain/entity/model/project_model.dart' as _i5;
import 'package:domain/repository/project_repository.dart' as _i18;
import 'package:domain/repository/setting_repository.dart' as _i14;
import 'package:domain/repository/user_repository.dart' as _i16;
import 'package:domain/usecase/get_contacts_use_case.dart' as _i15;
import 'package:domain/usecase/get_project_by_id_use_case.dart' as _i17;
import 'package:domain/usecase/get_projects_use_case.dart' as _i19;
import 'package:domain/usecase/get_user_skills_use_case.dart' as _i20;
import 'package:domain/usecase/get_user_use_case.dart' as _i25;
import 'package:domain/usecase/update_local_config_use_case.dart' as _i13;
import 'package:injectable/injectable.dart' as _i1;

class DomainPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.Mapper<_i4.ProjectDTO, _i5.ProjectModel>>(
        () => _i6.ProjectMapper());
    gh.factory<_i3.Mapper<_i7.ContactsDTO, _i8.ContactsModel>>(
        () => _i9.ContactMapper());
    gh.factory<_i3.Mapper<_i10.PortfolioSkillsDTO, _i11.PortfolioSkillsModel>>(
        () => _i12.PortfolioSkillsMapper());
    gh.factory<_i13.UpdateLocalConfigUseCase>(
        () => _i13.UpdateLocalConfigUseCaseImpl(gh<_i14.ConfigRepository>()));
    gh.factory<_i15.GetContactsUseCase>(() => _i15.GetContactsUseCaseImpl(
          gh<_i16.UserRepository>(),
          gh<_i3.Mapper<_i7.ContactsDTO, _i8.ContactsModel>>(),
        ));
    gh.factory<_i17.GetProjectByIdUseCase>(() => _i17.GetProjectByIdUseCaseImpl(
          gh<_i18.ProjectRepository>(),
          gh<_i3.Mapper<_i4.ProjectDTO, _i5.ProjectModel>>(),
        ));
    gh.factory<_i19.GetProjectsUseCase>(() => _i19.GetProjectsUseCaseImpl(
          gh<_i18.ProjectRepository>(),
          gh<_i3.Mapper<_i4.ProjectDTO, _i5.ProjectModel>>(),
        ));
    gh.factory<_i20.GetUserSkillsUseCase>(() => _i20.GetUserUseCaseSkillsImpl(
          gh<_i21.UserRepository>(),
          gh<_i3.Mapper<_i21.PortfolioSkillsDTO, _i21.PortfolioSkillsModel>>(),
        ));
    gh.factory<_i3.Mapper<_i22.PortfolioUserDTO, _i23.PortfolioUserModel>>(() =>
        _i24.PortfolioUserMapper(gh<
            _i3.Mapper<_i10.PortfolioSkillsDTO, _i11.PortfolioSkillsModel>>()));
    gh.factory<_i25.GetUserUseCase>(() => _i25.GetUserUseCaseImpl(
          gh<_i16.UserRepository>(),
          gh<_i3.Mapper<_i22.PortfolioUserDTO, _i23.PortfolioUserModel>>(),
        ));
  }
}
