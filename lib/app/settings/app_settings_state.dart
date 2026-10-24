part of 'app_settings_cubit.dart';

@freezed
abstract class AppSettingsState with _$AppSettingsState {
  const AppSettingsState._();

  const factory AppSettingsState({required Language language, required ThemeMode themeMode}) = _AppSettingsState;

  /// The locale MaterialApp and the localization delegates use.
  Locale get locale => language.locale;
}
