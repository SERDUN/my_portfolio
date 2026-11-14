import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import '../state/language_source.dart';
import 'theme_preference.dart';

part 'app_settings_state.dart';

part 'app_settings_cubit.freezed.dart';

/// The app-wide choices: content language and theme. Provided once above the
/// router; the app renders from it and page cubits reload from it through
/// [LanguageSource]. The single owner of both facts.
class AppSettingsCubit extends Cubit<AppSettingsState> implements LanguageSource {
  AppSettingsCubit({Language language = Language.fallback, ThemePreference theme = ThemePreference.system})
    : super(AppSettingsState(language: language, theme: theme));

  void changeLanguage(Language language) => emit(state.copyWith(language: language));

  void changeTheme(ThemePreference theme) => emit(state.copyWith(theme: theme));

  @override
  Language get language => state.language;

  @override
  Stream<Language> get languageChanges => distinctLanguageChanges(() => state.language, stream.map((s) => s.language));
}
