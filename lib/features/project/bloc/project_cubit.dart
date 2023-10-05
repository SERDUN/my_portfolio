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
    this.languageNotifier,
    this.projectId,
  ) : super(const ProjectState()) {
    _initState();
    languageNotifier.addListener(_initState);
  }

  final String projectId;

  final LanguageNotifier languageNotifier;

  final GetProjectByIdUseCase useCase;

  StreamSubscription? _userStreamSubscription;

  void _initState() {
    getProjectById(projectId);
  }

  void getProjectById(String id) async {
    _userStreamSubscription?.cancel();
    _userStreamSubscription = null;
    _userStreamSubscription = useCase.execute(id: id).listen((event) {
      emit(state.copyWith(status: ProjectStatus.success, project: event));
    });
  }

  @override
  Future<void> close() async {
    await super.close();
    _userStreamSubscription?.cancel();
  }
}
