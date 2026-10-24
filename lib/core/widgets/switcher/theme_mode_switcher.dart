import 'package:material_ui/material_ui.dart';

/// Shows the icon of the theme mode that is currently applied and, on tap,
/// requests the next mode in the cycle system -> light -> dark -> system.
class ThemeModeSwitcher extends StatelessWidget {
  const ThemeModeSwitcher({
    super.key,
    required this.themeMode,
    required this.onThemeChange,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () => onThemeChange(_nextThemeMode(themeMode)),
      child: Icon(
        _iconForThemeMode(themeMode),
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  static ThemeMode _nextThemeMode(ThemeMode current) {
    switch (current) {
      case ThemeMode.system:
        return ThemeMode.light;
      case ThemeMode.light:
        return ThemeMode.dark;
      case ThemeMode.dark:
        return ThemeMode.system;
    }
  }

  static IconData _iconForThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return Icons.nightlight_round;
      case ThemeMode.light:
        return Icons.wb_sunny_rounded;
      case ThemeMode.system:
        return Icons.auto_awesome;
    }
  }
}
