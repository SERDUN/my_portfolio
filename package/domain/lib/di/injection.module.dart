// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

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
    gh.factory<_i481.GetUsefulCommandsUseCase>(() => _i481.GetUsefulCommandsUseCaseImpl(gh<_i174.UsefulRepository>()));
    gh.factory<_i542.GetUserUseCase>(() => _i542.GetUserUseCaseImpl(gh<_i174.UserRepository>()));
    gh.factory<_i1021.GetContactsUseCase>(() => _i1021.GetContactsUseCaseImpl(gh<_i174.UserRepository>()));
    gh.factory<_i32.GetProjectsUseCase>(() => _i32.GetProjectsUseCaseImpl(gh<_i174.ProjectRepository>()));
    gh.factory<_i402.GetProjectByIdUseCase>(() => _i402.GetProjectByIdUseCaseImpl(gh<_i174.ProjectRepository>()));
    gh.factory<_i802.GetUserSkillsUseCase>(() => _i802.GetUserSkillsUseCaseImpl(gh<_i174.UserRepository>()));
  }
}
