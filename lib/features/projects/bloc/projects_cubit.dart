import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'projects_state.dart';

part 'projects_cubit.freezed.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  final GetProjectsUseCase useCase;

  ProjectsCubit(this.useCase) : super(const ProjectsState(status: ProjectsStatus.initial));

  void getProjects() async {
    var projectResult = await useCase.execute();
    emit(state.copyWith(projects: projectResult));
  }
}
