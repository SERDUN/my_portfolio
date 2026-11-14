part of 'app_settings_cubit.dart';

@freezed
abstract class AppSettingsState with _$AppSettingsState {
  const factory AppSettingsState({required Language language, required ThemePreference theme}) = _AppSettingsState;
}
