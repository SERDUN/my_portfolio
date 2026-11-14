import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

void main() {
  test('every theme preference maps onto its ThemeMode', () {
    expect(ThemePreference.system.themeMode, ThemeMode.system);
    expect(ThemePreference.light.themeMode, ThemeMode.light);
    expect(ThemePreference.dark.themeMode, ThemeMode.dark);
  });

  test('every language maps onto its locale', () {
    expect(Language.en.locale, const Locale('en'));
    expect(Language.uk.locale, const Locale('uk'));
  });
}
