import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'projects_state.dart';

part 'projects_cubit.freezed.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit(this.useCase) : super(const ProjectsState(status: ProjectsStatus.initial));

  final GetProjectsUseCase useCase;
  StreamSubscription? _projectsStreamSubscription;

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
  }
}
