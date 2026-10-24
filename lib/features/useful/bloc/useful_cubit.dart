import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_portfolio/localization/localization.dart';

part 'useful_state.dart';

part 'useful_cubit.freezed.dart';

class UsefulCubit extends Cubit<UsefulState> {
  UsefulCubit(this.useCase, this.languageNotifier) : super(const UsefulState(status: UsefulStatus.initial)) {
    _reload();
    languageNotifier.addListener(_reload);
  }

  final LanguageNotifier languageNotifier;

  final GetUsefulCommandsUseCase useCase;

  StreamSubscription? _usefulCommandsStreamSubscription;

  void _reload() => getUsefulCommands(languageNotifier.language);

  void getUsefulCommands(Language language) {
    _usefulCommandsStreamSubscription?.cancel();
    _usefulCommandsStreamSubscription = useCase.execute(language: language).listen((event) {
      emit(state.copyWith(usefulCommands: event, status: UsefulStatus.success));
    });
  }

  @override
  Future<void> close() async {
    await super.close();
    _usefulCommandsStreamSubscription?.cancel();
    languageNotifier.removeListener(_reload);
  }
}
