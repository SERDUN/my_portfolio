import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'event.dart';
import 'state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final GetProjectsUseCase useCase;

  ProjectsBloc(this.useCase) : super(ProjectsState().init()) {
    on<InitProjectsEvent>(_init);
  }

  void _init(InitProjectsEvent event, Emitter<ProjectsState> emit) async {
    var projectResult = await useCase.execute(lang: event.locale!);
    emit(state.fill(projectResult));
  }
}
