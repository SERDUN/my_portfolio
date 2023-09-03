import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'event.dart';
import 'state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final GetUserUseCase userUseCase;
  final GetUserSkillsUseCase skillsUseCase;

  InfoBloc(this.userUseCase, this.skillsUseCase) : super(InfoState().init()) {
    on<GetUserEvent>(_getUserEvent);
    on<GetUserSkillsEvent>(_getUserSkills);
  }

  void _getUserEvent(GetUserEvent event, Emitter<InfoState> emit) async {
    var user = (await userUseCase.execute(lang: event.locale!));
    emit(state.fill(user));
  }

  void _getUserSkills(GetUserSkillsEvent event, Emitter<InfoState> emit) async {
    var user = (await skillsUseCase.execute(lang: "en"));
    emit(state.fillSkills(user));
  }
}
