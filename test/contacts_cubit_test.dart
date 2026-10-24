import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart' show ThemeMode;

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/settings/settings.dart';
import 'package:my_portfolio/core/state/state.dart';
import 'package:my_portfolio/app/contacts/contacts.dart';

class _Contacts implements GetContactsUseCase {
  final controller = StreamController<List<ContactModel>>.broadcast();
  final List<Language> languages = [];

  @override
  Stream<List<ContactModel>> execute({required Language language}) {
    languages.add(language);
    return controller.stream;
  }
}

void main() {
  late _Contacts useCase;
  late AppSettingsCubit settings;
  late ContactsCubit cubit;

  final channels = [ContactModel(title: 'Email', value: 'me@example.com')];

  setUp(() {
    useCase = _Contacts();
    settings = AppSettingsCubit();
    cubit = ContactsCubit(useCase, settings);
  });

  tearDown(() async {
    await cubit.close();
    await settings.close();
    await useCase.controller.close();
  });

  test('starts loading and subscribes once', () {
    expect(cubit.state, const ContactsState(status: LoadStatus.loading));
    expect(useCase.languages, [Language.en]);
  });

  test('emits success with the channels, and again for a new list', () async {
    final states = <ContactsState>[];
    final subscription = cubit.stream.listen(states.add);

    useCase.controller.add(channels);
    await Future<void>.delayed(Duration.zero);
    useCase.controller.add(const []);
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();

    expect(states.map((s) => s.contacts.length), [1, 0]);
    expect(states.map((s) => s.status), everyElement(LoadStatus.success));
  });

  test('an error is a failure that load() recovers from', () async {
    useCase.controller.addError(Exception('offline'));
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.status, LoadStatus.failure);

    cubit.load();
    useCase.controller.add(channels);
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.status, LoadStatus.success);
    expect(cubit.state.error, isNull);
  });

  test('reloads on a language change, not on a theme change, and never after close', () async {
    settings.changeThemeMode(ThemeMode.dark);
    await Future<void>.delayed(Duration.zero);
    expect(useCase.languages, [Language.en]);

    settings.changeLanguage(Language.uk);
    await Future<void>.delayed(Duration.zero);
    expect(useCase.languages, [Language.en, Language.uk]);

    await cubit.close();
    settings.changeLanguage(Language.en);
    await Future<void>.delayed(Duration.zero);
    expect(useCase.languages, [Language.en, Language.uk], reason: 'a closed cubit must not reload');
  });
}
