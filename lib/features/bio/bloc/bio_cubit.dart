import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bio_state.dart';

part 'bio_cubit.freezed.dart';

class BioCubit extends Cubit<BioState> {
  final GetUserUseCase userUseCase;
  final GetUserSkillsUseCase skillsUseCase;

  BioCubit(this.userUseCase, this.skillsUseCase) : super(const BioState()) {
    getUserEvent();
    getUserSkills();
  }

  void getUserEvent() async {
    var user = (await userUseCase.execute());
    emit(state.copyWith(status: BioStatus.success, user: user));
  }

  void getUserSkills() async {
    var skills = await skillsUseCase.execute(lang: "en");
    emit(state.copyWith(status: BioStatus.success, skills: skills));
  }
}
