import 'package:material_ui/material_ui.dart' show ThemeMode;

import 'package:presentation/presentation.dart';

/// The bridge between the shared [ThemePreference] and Flutter's [ThemeMode].
extension ThemePreferenceMode on ThemePreference {
  ThemeMode get themeMode => switch (this) {
    ThemePreference.system => ThemeMode.system,
    ThemePreference.light => ThemeMode.light,
    ThemePreference.dark => ThemeMode.dark,
  };
}
