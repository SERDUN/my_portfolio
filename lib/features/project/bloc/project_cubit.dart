import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_state.dart';

part 'project_cubit.freezed.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this.useCase) : super(const ProjectState());

  final GetProjectByIdUseCase useCase;

  void getProjectById(String id) async {
    var projectResult = await useCase.execute(id: id);
    emit(state.copyWith(project: projectResult));
  }
}
