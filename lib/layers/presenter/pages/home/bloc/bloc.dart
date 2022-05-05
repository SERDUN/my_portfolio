import 'package:bloc/bloc.dart';
import 'package:my_portfolio/layers/domain/common/base_use_case_arg.dart';

import '../../../../domain/usecase/user/get_user_use_case.dart';
import 'event.dart';
import 'state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final GetUserUseCase userUseCase;

  InfoBloc(this.userUseCase) : super(InfoState().init()) {
    on<GetUserEvent>(_getUserEvent);
  }

  void _getUserEvent(GetUserEvent event, Emitter<InfoState> emit) async {
    var user =
        (await userUseCase.execute(argument: BaseUseCaseArg(event.locale)))
            .right;
    emit(state.fill(user));
  }
}
