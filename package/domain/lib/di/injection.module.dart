// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:data/data.dart' as _i437;
import 'package:domain/common/common.dart' as _i563;
import 'package:domain/common/config.dart' as _i523;
import 'package:domain/common/mapper_contract.dart' as _i168;
import 'package:domain/entity/entity.dart' as _i562;
import 'package:domain/entity/mapper/contact_mapper.dart' as _i155;
import 'package:domain/entity/mapper/portfolio_skills_mapper.dart' as _i592;
import 'package:domain/entity/mapper/portfolio_user_mapper.dart' as _i794;
import 'package:domain/entity/mapper/project_mapper.dart' as _i883;
import 'package:domain/entity/mapper/useful_commands_mapper.dart' as _i10;
import 'package:domain/entity/model/contacts_model.dart' as _i9;
import 'package:domain/entity/model/portfolio_skills_model.dart' as _i20;
import 'package:domain/entity/model/portfolio_user_model.dart' as _i705;
import 'package:domain/entity/model/project_model.dart' as _i531;
import 'package:domain/repository/repository.dart' as _i174;
import 'package:domain/usecase/get_contacts_use_case.dart' as _i1021;
import 'package:domain/usecase/get_project_by_id_use_case.dart' as _i402;
import 'package:domain/usecase/get_projects_use_case.dart' as _i32;
import 'package:domain/usecase/get_useful_commands_use_case.dart' as _i481;
import 'package:domain/usecase/get_user_skills_use_case.dart' as _i802;
import 'package:domain/usecase/get_user_use_case.dart' as _i542;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.singleton<_i523.Config>(() => _i523.Config());
    gh.factory<_i168.Mapper<_i437.ContactsDTO, _i9.ContactsModel>>(
        () => _i155.ContactMapper());
    gh.factory<_i168.Mapper<_i437.ProjectDTO, _i531.ProjectModel>>(
        () => _i883.ProjectMapper());
    gh.factory<
            _i168.Mapper<_i437.PortfolioSkillsDTO, _i20.PortfolioSkillsModel>>(
        () => _i592.PortfolioSkillsMapper());
    gh.factory<
            _i563.Mapper<_i437.UsefulCommandsDTO, _i562.UsefulCommandsModel>>(
        () => _i10.UsefulCommandsMapper());
    gh.factory<_i168.Mapper<_i437.PortfolioUserDTO, _i705.PortfolioUserModel>>(
        () => _i794.PortfolioUserMapper(gh<
            _i168
            .Mapper<_i437.PortfolioSkillsDTO, _i20.PortfolioSkillsModel>>()));
    gh.factory<_i1021.GetContactsUseCase>(() => _i1021.GetContactsUseCaseImpl(
          gh<_i563.Config>(),
          gh<_i174.UserRepository>(),
          gh<_i563.Mapper<_i437.ContactsDTO, _i562.ContactsModel>>(),
        ));
    gh.factory<_i481.GetUsefulCommandsUseCase>(() =>
        _i481.GetUsefulCommandsUseCaseImpl(
          gh<_i563.Config>(),
          gh<_i174.UsefulRepository>(),
          gh<
              _i563
              .Mapper<_i437.UsefulCommandsDTO, _i562.UsefulCommandsModel>>(),
        ));
    gh.factory<_i542.GetUserUseCase>(() => _i542.GetUserUseCaseImpl(
          gh<_i563.Config>(),
          gh<_i174.UserRepository>(),
          gh<_i563.Mapper<_i437.PortfolioUserDTO, _i562.PortfolioUserModel>>(),
        ));
    gh.factory<_i32.GetProjectsUseCase>(() => _i32.GetProjectsUseCaseImpl(
          gh<_i563.Config>(),
          gh<_i174.ProjectRepository>(),
          gh<_i563.Mapper<_i437.ProjectDTO, _i562.ProjectModel>>(),
        ));
    gh.factory<_i802.GetUserSkillsUseCase>(() => _i802.GetUserUseCaseSkillsImpl(
          gh<_i563.Config>(),
          gh<_i174.UserRepository>(),
          gh<
              _i563
              .Mapper<_i437.PortfolioSkillsDTO, _i562.PortfolioSkillsModel>>(),
        ));
    gh.factory<_i402.GetProjectByIdUseCase>(
        () => _i402.GetProjectByIdUseCaseImpl(
              gh<_i563.Config>(),
              gh<_i174.ProjectRepository>(),
              gh<_i563.Mapper<_i437.ProjectDTO, _i562.ProjectModel>>(),
            ));
  }
}
