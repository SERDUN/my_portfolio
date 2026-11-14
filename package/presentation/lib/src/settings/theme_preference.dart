/// Which theme the visitor asked for. The presenter maps it onto its own
/// notion (Flutter's `ThemeMode`, a CSS `color-scheme`); keeping it here keeps
/// the settings state free of any UI framework.
enum ThemePreference {
  system,
  light,
  dark;

  /// The choice after this one in the header toggle: system, light, dark, and
  /// round again.
  ThemePreference get next => values[(index + 1) % values.length];
}
