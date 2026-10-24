import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/localization/localization.dart';

part 'project_state.dart';

part 'project_cubit.freezed.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(
    this.useCase,
    this.projectsUseCase,
    this.languageNotifier,
    this.projectId,
  ) : super(const ProjectState()) {
    _initState();
    languageNotifier.addListener(_initState);
  }

  final String projectId;

  final LanguageNotifier languageNotifier;

  final GetProjectByIdUseCase useCase;

  /// The whole list, for the "next project" link at the bottom.
  final GetProjectsUseCase projectsUseCase;

  StreamSubscription? _projectSubscription;
  StreamSubscription? _projectsSubscription;

  void _initState() {
    final language = languageNotifier.language;
    getProjectById(projectId, language);
    _projectsSubscription?.cancel();
    _projectsSubscription = projectsUseCase.execute(language: language).listen((event) {
      if (!isClosed) emit(state.copyWith(projects: event));
    });
  }

  void getProjectById(String id, Language language) {
    _projectSubscription?.cancel();
    _projectSubscription = useCase.execute(id: id, language: language).listen((event) {
      if (!isClosed) emit(state.copyWith(status: ProjectStatus.success, project: event));
    });
  }

  @override
  Future<void> close() async {
    languageNotifier.removeListener(_initState);
    await _projectSubscription?.cancel();
    await _projectsSubscription?.cancel();
    return super.close();
  }
}
