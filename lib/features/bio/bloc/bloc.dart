import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'event.dart';
import 'state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final GetUserUseCase userUseCase;

  InfoBloc(this.userUseCase) : super(InfoState().init()) {
    on<GetUserEvent>(_getUserEvent);
  }

  void _getUserEvent(GetUserEvent event, Emitter<InfoState> emit) async {
    var user =
        (await userUseCase.execute(lang: event.locale!));
    emit(state.fill(user));
  }
}
