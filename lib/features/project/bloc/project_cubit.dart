import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';

part 'project_state.dart';

part 'project_cubit.freezed.dart';

/// One project page. The project decides the status; the list (for the
/// "next project" link) is secondary and is cleared when it fails.
class ProjectCubit extends Cubit<ProjectState> with CubitSubscriptions<ProjectState>, LanguageReload<ProjectState> {
  ProjectCubit(this.useCase, this.projectsUseCase, LanguageSource languages, this.projectId)
    : super(const ProjectState()) {
    reloadOn(languages);
  }

  final String projectId;

  final GetProjectByIdUseCase useCase;

  /// The whole list, for the "next project" link at the bottom.
  final GetProjectsUseCase projectsUseCase;

  @override
  void load() {
    loadPrimary(
      #project,
      useCase.execute(id: projectId, language: language),
      loading: state.copyWith(status: LoadStatus.loading, error: null),
      success: (project) => state.copyWith(status: LoadStatus.success, project: project),
      failure: (error) => state.copyWith(
        status: LoadStatus.failure,
        error: error,
        // A project missing in this language is gone, not stale: drop it.
        project: error is ProjectNotFoundException ? null : state.project,
      ),
    );
    subscribe(
      #projects,
      projectsUseCase.execute(language: language),
      onData: (projects) => emit(state.copyWith(projects: projects)),
      onError: (_, _) => emit(state.copyWith(projects: const [])),
    );
  }
}
