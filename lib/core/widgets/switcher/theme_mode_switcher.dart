import 'package:flutter/material.dart';

class ThemeModeSwitcher extends StatefulWidget {
  const ThemeModeSwitcher({
    super.key,
    required this.themeMode,
    required this.onThemeChange,
  });

  final ThemeMode themeMode;
  final Function(ThemeMode themeMode) onThemeChange;

  @override
  State<ThemeModeSwitcher> createState() => _ThemeModeSwitcherState();
}

class _ThemeModeSwitcherState extends State<ThemeModeSwitcher> {
  late int _themeModePosition = widget.themeMode.index + 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: _onThemeChanged,
      child: Icon(
        _getIconForThemeMode(_currentTheme()),
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }

  ThemeMode _currentTheme() {
    return ThemeMode.values[_themeModePosition % 3];
  }

  IconData _getIconForThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return Icons.nightlight_round;
      case ThemeMode.light:
        return Icons.wb_sunny_rounded;
      case ThemeMode.system:
        return Icons.auto_awesome;
    }
  }

  void _onThemeChanged() {
    widget.onThemeChange(_currentTheme());
    _themeModePosition++;
    setState(() {});
  }
}
