import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

/// Home page data. The profile decides the page status; skills and projects
/// are secondary: a failure clears that section (so no stale other-language
/// data lingers) and is logged, the rest of the page stays.
class HomeCubit extends Cubit<HomeState> with CubitSubscriptions<HomeState>, LanguageReload<HomeState> {
  HomeCubit(this.userUseCase, this.skillsUseCase, this.projectsUseCase, LanguageSource languages)
    : super(const HomeState()) {
    reloadOn(languages);
  }

  final GetUserUseCase userUseCase;
  final GetUserSkillsUseCase skillsUseCase;
  final GetProjectsUseCase projectsUseCase;

  /// One language snapshot per load so the three streams never disagree.
  @override
  void load() {
    loadPrimary(
      #user,
      userUseCase.execute(language: language),
      loading: state.copyWith(status: LoadStatus.loading, error: null),
      success: (user) => state.copyWith(status: LoadStatus.success, user: user),
      failure: (error) => state.copyWith(status: LoadStatus.failure, error: error),
    );
    subscribe(
      #skills,
      skillsUseCase.execute(language: language),
      onData: (skills) => emit(state.copyWith(skills: skills)),
      onError: (_, _) => emit(state.copyWith(skills: null)),
    );
    subscribe(
      #projects,
      projectsUseCase.execute(language: language),
      onData: (projects) => emit(state.copyWith(projects: projects)),
      onError: (_, _) => emit(state.copyWith(projects: const [])),
    );
  }
}
