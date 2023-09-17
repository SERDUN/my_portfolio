//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data/di/injection.module.dart' as _i3;
import 'package:domain/common/common.dart' as _i19;
import 'package:domain/common/config.dart' as _i4;
import 'package:domain/common/mapper_contract.dart' as _i5;
import 'package:domain/entity/dto/contacts_dto.dart' as _i9;
import 'package:domain/entity/dto/portfolio_skills_dto.dart' as _i12;
import 'package:domain/entity/dto/portfolio_user_dto.dart' as _i15;
import 'package:domain/entity/dto/project_dto.dart' as _i6;
import 'package:domain/entity/entity.dart' as _i21;
import 'package:domain/entity/mapper/contact_mapper.dart' as _i11;
import 'package:domain/entity/mapper/portfolio_skills_mapper.dart' as _i14;
import 'package:domain/entity/mapper/portfolio_user_mapper.dart' as _i17;
import 'package:domain/entity/mapper/project_mapper.dart' as _i8;
import 'package:domain/entity/model/contacts_model.dart' as _i10;
import 'package:domain/entity/model/portfolio_skills_model.dart' as _i13;
import 'package:domain/entity/model/portfolio_user_model.dart' as _i16;
import 'package:domain/entity/model/project_model.dart' as _i7;
import 'package:domain/repository/repository.dart' as _i20;
import 'package:domain/usecase/get_contacts_use_case.dart' as _i18;
import 'package:domain/usecase/get_project_by_id_use_case.dart' as _i22;
import 'package:domain/usecase/get_projects_use_case.dart' as _i23;
import 'package:domain/usecase/get_user_skills_use_case.dart' as _i24;
import 'package:domain/usecase/get_user_use_case.dart' as _i25;
import 'package:injectable/injectable.dart' as _i1;

class DomainPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    await _i3.DataPackageModule().init(gh);
    gh.singleton<_i4.Config>(_i4.Config());
    gh.factory<_i5.Mapper<_i6.ProjectDTO, _i7.ProjectModel>>(
        () => _i8.ProjectMapper());
    gh.factory<_i5.Mapper<_i9.ContactsDTO, _i10.ContactsModel>>(
        () => _i11.ContactMapper());
    gh.factory<_i5.Mapper<_i12.PortfolioSkillsDTO, _i13.PortfolioSkillsModel>>(
        () => _i14.PortfolioSkillsMapper());
    gh.factory<_i5.Mapper<_i15.PortfolioUserDTO, _i16.PortfolioUserModel>>(() =>
        _i17.PortfolioUserMapper(gh<
            _i5.Mapper<_i12.PortfolioSkillsDTO, _i13.PortfolioSkillsModel>>()));
    gh.factory<_i18.GetContactsUseCase>(() => _i18.GetContactsUseCaseImpl(
          gh<_i19.Config>(),
          gh<_i20.UserRepository>(),
          gh<_i19.Mapper<_i21.ContactsDTO, _i21.ContactsModel>>(),
        ));
    gh.factory<_i22.GetProjectByIdUseCase>(() => _i22.GetProjectByIdUseCaseImpl(
          gh<_i19.Config>(),
          gh<_i20.ProjectRepository>(),
          gh<_i19.Mapper<_i21.ProjectDTO, _i21.ProjectModel>>(),
        ));
    gh.factory<_i23.GetProjectsUseCase>(() => _i23.GetProjectsUseCaseImpl(
          gh<_i19.Config>(),
          gh<_i20.ProjectRepository>(),
          gh<_i19.Mapper<_i21.ProjectDTO, _i21.ProjectModel>>(),
        ));
    gh.factory<_i24.GetUserSkillsUseCase>(() => _i24.GetUserUseCaseSkillsImpl(
          gh<_i19.Config>(),
          gh<_i20.UserRepository>(),
          gh<_i19.Mapper<_i21.PortfolioSkillsDTO, _i21.PortfolioSkillsModel>>(),
        ));
    gh.factory<_i25.GetUserUseCase>(() => _i25.GetUserUseCaseImpl(
          gh<_i19.Config>(),
          gh<_i20.UserRepository>(),
          gh<_i19.Mapper<_i21.PortfolioUserDTO, _i21.PortfolioUserModel>>(),
        ));
  }
}
