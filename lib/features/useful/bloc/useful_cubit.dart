import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';

part 'useful_state.dart';

part 'useful_cubit.freezed.dart';

/// Command groups for the cheat sheet page.
class UsefulCubit extends Cubit<UsefulState> with CubitSubscriptions<UsefulState>, LanguageReload<UsefulState> {
  UsefulCubit(this.useCase, LanguageSource languages) : super(const UsefulState()) {
    reloadOn(languages);
  }

  final GetUsefulCommandsUseCase useCase;

  @override
  void load() => loadPrimary(
    #groups,
    useCase.execute(language: language),
    loading: state.copyWith(status: LoadStatus.loading, error: null),
    success: (groups) => state.copyWith(status: LoadStatus.success, groups: groups),
    failure: (error) => state.copyWith(status: LoadStatus.failure, error: error),
  );
}
