import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/features/bio/bloc/bio_cubit.dart';
import 'package:my_portfolio/localization/localization.dart';

class FakeGetUserUseCase implements GetUserUseCase {
  final controller = StreamController<PortfolioUserModel>.broadcast();
  int executions = 0;

  @override
  Stream<PortfolioUserModel> execute() {
    executions++;
    return controller.stream;
  }
}

class FakeGetUserSkillsUseCase implements GetUserSkillsUseCase {
  final controller = StreamController<List<PortfolioSkillsModel>>.broadcast();
  int executions = 0;

  @override
  Stream<List<PortfolioSkillsModel>> execute() {
    executions++;
    return controller.stream;
  }
}

final user = PortfolioUserModel(
  firstName: 'Dmitro',
  secondName: 'Serdun',
  position: 'Mobile Developer',
  intro: 'Hi',
  avatar: '',
  cv: '',
);

final skills = [PortfolioSkillsModel(title: 'Flutter', expanded: true, children: const [])];

void main() {
  late FakeGetUserUseCase userUseCase;
  late FakeGetUserSkillsUseCase skillsUseCase;
  late LanguageNotifier languageNotifier;
  late BioCubit cubit;

  setUp(() {
    userUseCase = FakeGetUserUseCase();
    skillsUseCase = FakeGetUserSkillsUseCase();
    languageNotifier = LanguageNotifier((_) {});
    cubit = BioCubit(userUseCase, skillsUseCase, languageNotifier);
  });

  tearDown(() async {
    await cubit.close();
    await userUseCase.controller.close();
    await skillsUseCase.controller.close();
  });

  test('starts in the initial state and subscribes to both use cases', () {
    expect(cubit.state, const BioState());
    expect(cubit.state.status, BioStatus.initial);
    expect(cubit.state.user, isNull);
    expect(cubit.state.skills, isNull);
    expect(userUseCase.executions, 1);
    expect(skillsUseCase.executions, 1);
  });

  test('emits success with the user, then merges the skills in', () async {
    final states = <BioState>[];
    final subscription = cubit.stream.listen(states.add);

    userUseCase.controller.add(user);
    await Future<void>.delayed(Duration.zero);
    skillsUseCase.controller.add(skills);
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();

    expect(states, [
      BioState(status: BioStatus.success, user: user),
      BioState(status: BioStatus.success, user: user, skills: skills),
    ]);
  });

  test('does not emit when the stream repeats the same data', () async {
    final states = <BioState>[];
    final subscription = cubit.stream.listen(states.add);

    userUseCase.controller.add(user);
    await Future<void>.delayed(Duration.zero);
    userUseCase.controller.add(user);
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();

    expect(states, hasLength(1));
  });

  test('resubscribes to both use cases when the language changes', () async {
    languageNotifier.changeLanguage(const Locale('uk'));

    expect(userUseCase.executions, 2);
    expect(skillsUseCase.executions, 2);
    // The old subscriptions were cancelled: only the new ones listen.
    expect(userUseCase.controller.hasListener, isTrue);
  });

  test('close cancels the subscriptions and stops listening to the language', () async {
    await cubit.close();

    expect(userUseCase.controller.hasListener, isFalse);
    expect(skillsUseCase.controller.hasListener, isFalse);

    languageNotifier.changeLanguage(const Locale('uk'));
    expect(userUseCase.executions, 1, reason: 'a closed cubit must not resubscribe');
    expect(skillsUseCase.executions, 1);
  });
}
