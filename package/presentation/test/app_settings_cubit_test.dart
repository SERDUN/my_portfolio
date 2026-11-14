import 'package:test/test.dart';

import 'package:domain/domain.dart';

import 'package:presentation/presentation.dart';

void main() {
  late AppSettingsCubit settings;

  setUp(() => settings = AppSettingsCubit());
  tearDown(() => settings.close());

  test('starts in English with the system theme', () {
    expect(settings.state.language, Language.en);
    expect(settings.state.theme, ThemePreference.system);
  });

  test('changes language and theme independently', () {
    settings.changeLanguage(Language.uk);
    settings.changeTheme(ThemePreference.dark);

    expect(settings.state.language, Language.uk);
    expect(settings.state.theme, ThemePreference.dark);
  });

  test('languageChanges ignores theme changes and repeats', () async {
    final seen = <Language>[];
    final subscription = settings.languageChanges.listen(seen.add);

    settings.changeTheme(ThemePreference.dark);
    settings.changeLanguage(Language.uk);
    settings.changeTheme(ThemePreference.light);
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

  test('the theme toggle cycles system, light, dark and back', () {
    expect(ThemePreference.system.next, ThemePreference.light);
    expect(ThemePreference.light.next, ThemePreference.dark);
    expect(ThemePreference.dark.next, ThemePreference.system);
  });
}
