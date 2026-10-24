import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart' show ThemeMode;

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';
import 'package:my_portfolio/features/contact/bloc/contacts_cubit.dart';
import 'package:my_portfolio/app/settings/settings.dart';

class FakeGetContactsUseCase implements GetContactsUseCase {
  final controller = StreamController<List<ContactsModel>>.broadcast();
  int executions = 0;

  final List<Language> languages = [];

  @override
  Stream<List<ContactsModel>> execute({required Language language}) {
    executions++;
    languages.add(language);
    return controller.stream;
  }
}

void main() {
  late FakeGetContactsUseCase useCase;
  late AppSettingsCubit settings;
  late ContactsCubit cubit;

  final contacts = [ContactsModel(title: 'Email', value: 'me@example.com')];

  setUp(() {
    useCase = FakeGetContactsUseCase();
    settings = AppSettingsCubit();
    cubit = ContactsCubit(useCase, settings);
  });

  tearDown(() async {
    await cubit.close();
    await settings.close();
    await useCase.controller.close();
  });

  test('starts loading with no contacts and subscribes once', () {
    expect(cubit.state, const ContactsState(status: LoadStatus.loading));
    expect(cubit.state.contacts, isEmpty);
    expect(useCase.executions, 1);
  });

  test('emits success with the contacts', () async {
    final next = cubit.stream.first;

    useCase.controller.add(contacts);

    expect(await next, ContactsState(status: LoadStatus.success, contacts: contacts));
  });

  test('emits again when the use case pushes a new list', () async {
    final states = <ContactsState>[];
    final subscription = cubit.stream.listen(states.add);

    useCase.controller.add(contacts);
    await Future<void>.delayed(Duration.zero);
    useCase.controller.add(const []);
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();

    expect(states.map((s) => s.contacts.length), [1, 0]);
    expect(states.map((s) => s.status), everyElement(LoadStatus.success));
  });

  test('resubscribes when the language changes and stops after close', () async {
    settings.changeLanguage(Language.uk);
    await Future<void>.delayed(Duration.zero);
    expect(useCase.executions, 2);
    expect(useCase.languages, [Language.en, Language.uk]);

    await cubit.close();
    expect(useCase.controller.hasListener, isFalse);

    settings.changeLanguage(Language.en);
    await Future<void>.delayed(Duration.zero);
    expect(useCase.executions, 2, reason: 'a closed cubit must not resubscribe');
  });

  test('an error moves to failure and load() recovers', () async {
    useCase.controller.addError(Exception('offline'));
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.status, LoadStatus.failure);

    cubit.load();
    useCase.controller.add(contacts);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.status, LoadStatus.success);
    expect(cubit.state.error, isNull);
  });

  test('a theme change does not reload the page', () async {
    settings.changeThemeMode(ThemeMode.dark);
    await Future<void>.delayed(Duration.zero);

    expect(useCase.executions, 1);
  });
}
