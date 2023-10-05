import 'package:flutter/services.dart';

import 'package:domain/common/common.dart';

import 'assets.gen.dart';

extension AssetsDataGenExtension on $AssetsDataGen {
  Future<String> _getBundle(String path) async {
    final package = "packages/data/$path";
    return rootBundle.loadString(package);
  }

  Future<String> contact(String localization) => _getBundle(LanguageTools.checkLocale(localization, languageFunctions: {
        'en': () => en.contact,
        'uk': () => uk.contact,
      }));

  Future<String> projects(String localization) =>
      _getBundle(LanguageTools.checkLocale(localization, languageFunctions: {
        'en': () => en.projects,
        'uk': () => uk.projects,
      }));

  Future<String> skills(String localization) => _getBundle(LanguageTools.checkLocale(localization, languageFunctions: {
        'en': () => en.skills,
        'uk': () => uk.skills,
      }));

  Future<String> usefulCommands(String localization) =>
      _getBundle(LanguageTools.checkLocale(localization, languageFunctions: {
        'en': () => en.usefulCommands,
        'uk': () => uk.usefulCommands,
      }));

  Future<String> user(String localization) => _getBundle(LanguageTools.checkLocale(localization, languageFunctions: {
        'en': () => en.user,
        'uk': () => uk.user,
      }));
}
