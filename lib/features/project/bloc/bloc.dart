import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

import 'event.dart';
import 'state.dart';

class ProjectDetailsBloc extends Bloc<ProjectDetailsEvent, ProjectDetailsState> {
  final GetProjectByIdUseCase useCase;

  ProjectDetailsBloc(this.useCase) : super(ProjectDetailsState(null).init()) {
    on<InitEvent>(_init);
    on<GetProjectEvent>(_getProjectById);
  }

  void _init(InitEvent event, Emitter<ProjectDetailsState> emit) async {
    //  emit(state.clone());
  }

  void _getProjectById(GetProjectEvent event, Emitter<ProjectDetailsState> emit) async {
    var projectResult = await useCase.execute(lang: event.locale!, id: event.projectId);
    emit(state.fill(projectResult));
  }
}
