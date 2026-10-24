import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';
import 'package:my_portfolio/localization/localization.dart';

part 'bio_state.dart';

part 'bio_cubit.freezed.dart';

/// Home page data. The profile decides the page status; skills and projects
/// are secondary: a failure clears that section (so no stale other-language
/// data lingers) and is logged, the rest of the page stays.
class BioCubit extends Cubit<BioState> with CubitSubscriptions<BioState>, LanguageReload<BioState> {
  BioCubit(
    this.userUseCase,
    this.skillsUseCase,
    this.projectsUseCase,
    this.languageNotifier,
  ) : super(const BioState()) {
    reloadOn(languageNotifier);
  }

  final LanguageNotifier languageNotifier;

  final GetUserUseCase userUseCase;
  final GetUserSkillsUseCase skillsUseCase;
  final GetProjectsUseCase projectsUseCase;

  /// One language snapshot per load so the three streams never disagree.
  @override
  void load() {
    final language = languageNotifier.language;
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
