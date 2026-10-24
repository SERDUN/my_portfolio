import 'package:flutter/widgets.dart';

import 'package:domain/domain.dart';

/// The bridge between the domain [Language] and Flutter's [Locale].
extension LanguageLocale on Language {
  Locale get locale => Locale(code);
}

/// One locale per supported language: MaterialApp and the language toggle
/// both read this list.
final List<Locale> supportedLocales = [for (final language in Language.values) language.locale];
