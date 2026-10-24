import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';
import 'package:my_portfolio/localization/localization.dart';

part 'projects_state.dart';

part 'projects_cubit.freezed.dart';

/// All projects for the list page.
class ProjectsCubit extends Cubit<ProjectsState> with CubitSubscriptions<ProjectsState>, LanguageReload<ProjectsState> {
  ProjectsCubit(this.useCase, this.languageNotifier) : super(const ProjectsState()) {
    reloadOn(languageNotifier);
  }

  final LanguageNotifier languageNotifier;

  final GetProjectsUseCase useCase;

  @override
  void load() => loadPrimary(
        #projects,
        useCase.execute(language: languageNotifier.language),
        loading: state.copyWith(status: LoadStatus.loading, error: null),
        success: (projects) => state.copyWith(status: LoadStatus.success, projects: projects),
        failure: (error) => state.copyWith(status: LoadStatus.failure, error: error),
      );
}
