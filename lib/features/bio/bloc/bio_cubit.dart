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
    this.languageNotifier,
  ) : super(const BioState()) {
    _initState();
    languageNotifier.addListener(_initState);
  }

  final LanguageNotifier languageNotifier;

  final GetUserUseCase userUseCase;
  final GetUserSkillsUseCase skillsUseCase;

  StreamSubscription? _userStreamSubscription;
  StreamSubscription? _skillsStreamSubscription;

  void _initState() {
    subscribeOnUserData();
    subscribeOnUserSkills();
  }

  void subscribeOnUserData() {
    _userStreamSubscription?.cancel();
    _userStreamSubscription = null;
    _userStreamSubscription = userUseCase.execute().listen((event) {
      emit(state.copyWith(status: BioStatus.success, user: event));
    });
  }

  void subscribeOnUserSkills() async {
    _skillsStreamSubscription?.cancel();
    _skillsStreamSubscription = null;
    _skillsStreamSubscription = skillsUseCase.execute().listen((event) {
      emit(state.copyWith(status: BioStatus.success, skills: event));
    });
  }

  @override
  Future<void> close() async {
    await super.close();
    _userStreamSubscription?.cancel();
    _skillsStreamSubscription?.cancel();
    languageNotifier.removeListener(_initState);
  }
}
