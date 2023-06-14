import 'package:bloc/bloc.dart';
import 'package:my_portfolio/layers/domain/entity/argument/project_details_arg.dart';
import 'package:my_portfolio/layers/domain/usecase/projects/get_project_by_id_use_case.dart';

import 'event.dart';
import 'state.dart';

class ProjectDetailsBloc
    extends Bloc<ProjectDetailsEvent, ProjectDetailsState> {
  final GetProjectByIdUseCase useCase;

  ProjectDetailsBloc(this.useCase) : super(ProjectDetailsState(null).init()) {
    on<InitEvent>(_init);
    on<GetProjectEvent>(_getProjectById);
  }

  void _init(InitEvent event, Emitter<ProjectDetailsState> emit) async {
    //  emit(state.clone());
  }

  void _getProjectById(
      GetProjectEvent event, Emitter<ProjectDetailsState> emit) async {
    var projectResult = await useCase.execute(
        argument: ProjectDetailsArg(event.locale, event.projectId));
    if (projectResult.isRight) {
      emit(state.fill(projectResult.right));
    }
  }
}
