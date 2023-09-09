import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/localization/localization.dart';

part 'projects_state.dart';

part 'projects_cubit.freezed.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit(this.useCase, this.languageNotifier) : super(const ProjectsState(status: ProjectsStatus.initial)) {
    _initState();
    languageNotifier.addListener(_initState);
  }

  final LanguageNotifier languageNotifier;

  final GetProjectsUseCase useCase;

  StreamSubscription? _projectsStreamSubscription;

  void _initState() {
    getProjects();
  }

  void getProjects() async {
    _projectsStreamSubscription?.cancel();
    _projectsStreamSubscription = null;
    _projectsStreamSubscription = useCase.execute().listen((event) {
      emit(state.copyWith(projects: event));
    });
  }

  @override
  Future<void> close() async {
    await super.close();
    _projectsStreamSubscription?.cancel();
    languageNotifier.removeListener(_initState);
  }
}
