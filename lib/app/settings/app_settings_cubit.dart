import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_ui/material_ui.dart' show ThemeMode;

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/language_source.dart';
import 'package:my_portfolio/localization/language_locale.dart';

part 'app_settings_state.dart';

part 'app_settings_cubit.freezed.dart';

/// The app-wide choices: content language and theme mode. Provided once
/// above the router; MaterialApp renders from it and page cubits reload
/// from it through [LanguageSource]. The single owner of both facts.
class AppSettingsCubit extends Cubit<AppSettingsState> implements LanguageSource {
  AppSettingsCubit({Language language = Language.fallback, ThemeMode themeMode = ThemeMode.system})
    : super(AppSettingsState(language: language, themeMode: themeMode));

  void changeLanguage(Language language) => emit(state.copyWith(language: language));

  void changeThemeMode(ThemeMode themeMode) => emit(state.copyWith(themeMode: themeMode));

  @override
  Language get language => state.language;

  @override
  Stream<Language> get languageChanges => distinctLanguageChanges(() => state.language, stream.map((s) => s.language));
}
