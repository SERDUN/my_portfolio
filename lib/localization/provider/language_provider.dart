import 'package:flutter/widgets.dart';

import 'language_notifier.dart';

class LanguageProvider extends InheritedNotifier {
  const LanguageProvider({
    super.key,
    required this.languageNotifier,
    required this.onLanguageChanged,
    required super.child,
  });

  final LanguageNotifier languageNotifier;
  final Function(Locale value) onLanguageChanged;

  void setLocale(Locale value) {
    onLanguageChanged.call(value);
    languageNotifier.changeLanguage(Locale(value.languageCode));
  }

  static LanguageProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LanguageProvider>();
  }

  static LanguageProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<LanguageProvider>()?.widget;
    return widget is LanguageProvider ? widget : null;
  }
}
