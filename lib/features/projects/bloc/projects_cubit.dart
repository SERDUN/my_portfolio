import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';

part 'projects_state.dart';

part 'projects_cubit.freezed.dart';

/// All projects for the list page.
class ProjectsCubit extends Cubit<ProjectsState> with CubitSubscriptions<ProjectsState>, LanguageReload<ProjectsState> {
  ProjectsCubit(this.useCase, LanguageSource languages) : super(const ProjectsState()) {
    reloadOn(languages);
  }

  final GetProjectsUseCase useCase;

  @override
  void load() => loadPrimary(
    #projects,
    useCase.execute(language: language),
    loading: state.copyWith(status: LoadStatus.loading, error: null),
    success: (projects) => state.copyWith(status: LoadStatus.success, projects: projects),
    failure: (error) => state.copyWith(status: LoadStatus.failure, error: error),
  );
}
