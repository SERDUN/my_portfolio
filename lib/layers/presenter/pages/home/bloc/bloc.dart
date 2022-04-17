import 'package:bloc/bloc.dart';
import '../../../../domain/usecase/user/get_user_use_case.dart';
import 'event.dart';
import 'state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final GetUserUseCase userUseCase;

  InfoBloc(this.userUseCase) : super(InfoState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<InfoState> emit) async {
    var user = (await userUseCase.execute()).right;
    emit(state.fill(user));
  }
}
