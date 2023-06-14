import 'package:bloc/bloc.dart';
import 'package:my_portfolio/layers/domain/usecase/projects/get_projects_use_case.dart';

import '../../../../domain/common/base_use_case_arg.dart';
import 'event.dart';
import 'state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final GetProjectsUseCase useCase;

  ProjectsBloc(this.useCase) : super(ProjectsState().init()) {
    on<InitProjectsEvent>(_init);
  }

  void _init(InitProjectsEvent event, Emitter<ProjectsState> emit) async {
    var projectResult =
        await useCase.execute(argument: BaseUseCaseArg(event.locale));
    if (projectResult.isRight) {
      emit(state.fill(projectResult.right));
    }
  }
}
