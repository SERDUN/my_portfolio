import 'package:flutter/widgets.dart';

import 'language_notifier.dart';

class LanguageProvider extends InheritedNotifier {
  const LanguageProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  LanguageNotifier get languageNotifier => notifier as LanguageNotifier;

  void setLocale(Locale value) => languageNotifier.changeLanguage(Locale(value.languageCode));

  static LanguageProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LanguageProvider>();
  }

  static LanguageProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<LanguageProvider>()?.widget;
    return widget is LanguageProvider ? widget : null;
  }
}
