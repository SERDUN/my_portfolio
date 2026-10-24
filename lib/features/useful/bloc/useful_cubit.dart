import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';
import 'package:my_portfolio/localization/localization.dart';

part 'useful_state.dart';

part 'useful_cubit.freezed.dart';

/// Command groups for the cheat sheet page.
class UsefulCubit extends Cubit<UsefulState> with CubitSubscriptions<UsefulState>, LanguageReload<UsefulState> {
  UsefulCubit(this.useCase, this.languageNotifier) : super(const UsefulState()) {
    reloadOn(languageNotifier);
  }

  final LanguageNotifier languageNotifier;

  final GetUsefulCommandsUseCase useCase;

  @override
  void load() => loadPrimary(
        #usefulCommands,
        useCase.execute(language: languageNotifier.language),
        loading: state.copyWith(status: LoadStatus.loading, error: null),
        success: (usefulCommands) => state.copyWith(status: LoadStatus.success, usefulCommands: usefulCommands),
        failure: (error) => state.copyWith(status: LoadStatus.failure, error: error),
      );
}
