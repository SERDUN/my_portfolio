import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bio_state.dart';

part 'bio_cubit.freezed.dart';

class BioCubit extends Cubit<BioState> {
  BioCubit(this.userUseCase, this.skillsUseCase) : super(const BioState());

  final GetUserUseCase userUseCase;
  final GetUserSkillsUseCase skillsUseCase;

  StreamSubscription? _userStreamSubscription;
  StreamSubscription? _skillsStreamSubscription;

  void subscribeOnUserData() {
    _userStreamSubscription?.cancel();
    _userStreamSubscription = null;
    _userStreamSubscription = userUseCase.execute().listen((event) {
      emit(state.copyWith(status: BioStatus.success, user: event));
    });
  }

  void getUserSkills() async {
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
  }
}
