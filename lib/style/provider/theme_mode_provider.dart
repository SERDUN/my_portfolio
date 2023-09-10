import 'package:flutter/material.dart';

import 'theme_mode_notifier.dart';

class ThemeModeProvider extends InheritedNotifier {
  const ThemeModeProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  ThemeModelNotifier get themeModeNotifier => notifier as ThemeModelNotifier;

  void setThemeMode(ThemeMode themeMode) => (notifier as ThemeModelNotifier).changeThemeMode(themeMode);

  static ThemeModeProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeModeProvider>();
  }

  static ThemeModeProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<ThemeModeProvider>()?.widget;
    return widget is ThemeModeProvider ? widget : null;
  }
}
