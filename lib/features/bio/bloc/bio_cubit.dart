import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/localization/localization.dart';

part 'bio_state.dart';

part 'bio_cubit.freezed.dart';

class BioCubit extends Cubit<BioState> {
  BioCubit(
    this.userUseCase,
    this.skillsUseCase,
    this.projectsUseCase,
    this.languageNotifier,
  ) : super(const BioState()) {
    _initState();
    languageNotifier.addListener(_initState);
  }

  final LanguageNotifier languageNotifier;

  final GetUserUseCase userUseCase;
  final GetUserSkillsUseCase skillsUseCase;
  final GetProjectsUseCase projectsUseCase;

  StreamSubscription? _userStreamSubscription;
  StreamSubscription? _skillsStreamSubscription;
  StreamSubscription? _projectsStreamSubscription;

  void _initState() {
    subscribeOnUserData();
    subscribeOnUserSkills();
    subscribeOnProjects();
  }

  void subscribeOnUserData() {
    _userStreamSubscription?.cancel();
    _userStreamSubscription = userUseCase.execute().listen((event) {
      emit(state.copyWith(status: BioStatus.success, user: event));
    });
  }

  void subscribeOnUserSkills() {
    _skillsStreamSubscription?.cancel();
    _skillsStreamSubscription = skillsUseCase.execute().listen((event) {
      emit(state.copyWith(status: BioStatus.success, skills: event));
    });
  }

  void subscribeOnProjects() {
    _projectsStreamSubscription?.cancel();
    _projectsStreamSubscription = projectsUseCase.execute().listen((event) {
      emit(state.copyWith(projects: event));
    });
  }

  @override
  Future<void> close() async {
    await super.close();
    _userStreamSubscription?.cancel();
    _skillsStreamSubscription?.cancel();
    _projectsStreamSubscription?.cancel();
    languageNotifier.removeListener(_initState);
  }
}
