import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/settings/settings.dart';

void main() {
  late AppSettingsCubit settings;

  setUp(() => settings = AppSettingsCubit());
  tearDown(() => settings.close());

  test('starts in English with the system theme', () {
    expect(settings.state.language, Language.en);
    expect(settings.state.themeMode, ThemeMode.system);
    expect(settings.state.locale, const Locale('en'));
  });

  test('changes language and theme independently', () {
    settings.changeLanguage(Language.uk);
    settings.changeThemeMode(ThemeMode.dark);

    expect(settings.state.locale, const Locale('uk'));
    expect(settings.state.themeMode, ThemeMode.dark);
  });

  test('languageChanges ignores theme changes and repeats', () async {
    final seen = <Language>[];
    final subscription = settings.languageChanges.listen(seen.add);

    settings.changeThemeMode(ThemeMode.dark);
    settings.changeLanguage(Language.uk);
    settings.changeThemeMode(ThemeMode.light);
    settings.changeLanguage(Language.uk);
    settings.changeLanguage(Language.en);
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();

    expect(seen, [Language.uk, Language.en]);
  });

  test('two listeners on one languageChanges stream both see every change', () async {
    final changes = settings.languageChanges;
    final a = <Language>[];
    final b = <Language>[];
    final subA = changes.listen(a.add);
    final subB = changes.listen(b.add);

    settings.changeLanguage(Language.uk);
    settings.changeLanguage(Language.en);
    await Future<void>.delayed(Duration.zero);
    await subA.cancel();
    await subB.cancel();

    expect(a, [Language.uk, Language.en]);
    expect(b, [Language.uk, Language.en]);
  });
}
