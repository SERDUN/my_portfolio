import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'event.dart';
import 'state.dart';

class ProjectDetailsBloc extends Bloc<ProjectDetailsEvent, ProjectDetailsState> {
  final GetProjectByIdUseCase useCase;

  ProjectDetailsBloc(this.useCase) : super(ProjectDetailsState(null).init()) {
    on<GetProjectEvent>(_getProjectById);
  }

  void _getProjectById(GetProjectEvent event, Emitter<ProjectDetailsState> emit) async {
    var projectResult = await useCase.execute(id: event.projectId);
    emit(state.fill(projectResult));
  }
}
