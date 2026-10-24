import 'package:material_ui/material_ui.dart';

/// Round icon button that cycles system → light → dark → system. The icon
/// always shows the mode that is currently applied.
class ThemeModeSwitcher extends StatelessWidget {
  const ThemeModeSwitcher({
    super.key,
    required this.themeMode,
    required this.onThemeChange,
    this.tooltip,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChange;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: () => onThemeChange(_nextThemeMode(themeMode)),
      icon: Icon(_iconFor(themeMode), size: 20),
    );
  }

  static ThemeMode _nextThemeMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return ThemeMode.light;
      case ThemeMode.light:
        return ThemeMode.dark;
      case ThemeMode.dark:
        return ThemeMode.system;
    }
  }

  static IconData _iconFor(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return Icons.nightlight_round;
      case ThemeMode.light:
        return Icons.wb_sunny_rounded;
      case ThemeMode.system:
        return Icons.auto_awesome;
    }
  }
}
