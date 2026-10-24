import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/features/bio/bloc/bio_cubit.dart';
import 'package:my_portfolio/localization/localization.dart';

class FakeGetUserUseCase implements GetUserUseCase {
  final controller = StreamController<PortfolioUserModel>.broadcast();
  int executions = 0;

  final List<Language> languages = [];

  @override
  Stream<PortfolioUserModel> execute({required Language language}) {
    executions++;
    languages.add(language);
    return controller.stream;
  }
}

class FakeGetUserSkillsUseCase implements GetUserSkillsUseCase {
  final controller = StreamController<List<PortfolioSkillsModel>>.broadcast();
  int executions = 0;

  @override
  Stream<List<PortfolioSkillsModel>> execute({required Language language}) {
    executions++;
    return controller.stream;
  }
}

class FakeGetProjectsUseCase implements GetProjectsUseCase {
  final controller = StreamController<List<ProjectModel>>.broadcast();
  int executions = 0;

  @override
  Stream<List<ProjectModel>> execute({required Language language}) {
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

ProjectModel project(String id, {bool featured = false, String? preview, List<String> technologies = const []}) =>
    ProjectModel(
      id: id,
      name: 'Project $id',
      linkAndroid: '',
      linkIOS: '',
      linkGithub: '',
      preview: preview,
      featured: featured,
      technologies: technologies,
    );

void main() {
  late FakeGetUserUseCase userUseCase;
  late FakeGetUserSkillsUseCase skillsUseCase;
  late FakeGetProjectsUseCase projectsUseCase;
  late LanguageNotifier languageNotifier;
  late BioCubit cubit;

  setUp(() {
    userUseCase = FakeGetUserUseCase();
    skillsUseCase = FakeGetUserSkillsUseCase();
    projectsUseCase = FakeGetProjectsUseCase();
    languageNotifier = LanguageNotifier();
    cubit = BioCubit(userUseCase, skillsUseCase, projectsUseCase, languageNotifier);
  });

  tearDown(() async {
    await cubit.close();
    await userUseCase.controller.close();
    await skillsUseCase.controller.close();
    await projectsUseCase.controller.close();
  });

  test('starts in the initial state and subscribes to all three use cases', () {
    expect(cubit.state, const BioState());
    expect(cubit.state.status, BioStatus.initial);
    expect(cubit.state.user, isNull);
    expect(cubit.state.skills, isNull);
    expect(cubit.state.projects, isEmpty);
    expect(userUseCase.executions, 1);
    expect(skillsUseCase.executions, 1);
    expect(projectsUseCase.executions, 1);
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

  test('featured projects are the flagged ones, else the first three with a preview', () async {
    projectsUseCase.controller.add([
      project('1', preview: 'a'),
      project('2', featured: true),
      project('3', preview: 'c'),
    ]);
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.featuredProjects.map((p) => p.id), ['2']);

    projectsUseCase.controller.add([
      project('1', preview: 'a'),
      project('2'),
      project('3', preview: 'c'),
      project('4', preview: 'd'),
      project('5', preview: 'e'),
    ]);
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.featuredProjects.map((p) => p.id), ['1', '3', '4']);
  });

  test('platform count is the number of distinct platforms', () async {
    projectsUseCase.controller.add([
      project('1', technologies: ['Flutter', 'BLoC']),
      project('2', technologies: ['android', 'Java']),
      project('3', technologies: ['Dart', 'Flutter']),
    ]);
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.platformCount, 2);
  });

  test('resubscribes to all use cases with the new language when it changes', () async {
    languageNotifier.changeLanguage(const Locale('uk'));

    expect(userUseCase.languages, [Language.en, Language.uk]);
    expect(userUseCase.executions, 2);
    expect(skillsUseCase.executions, 2);
    expect(projectsUseCase.executions, 2);
    // The old subscriptions were cancelled: only the new ones listen.
    expect(userUseCase.controller.hasListener, isTrue);
  });

  test('close cancels the subscriptions and stops listening to the language', () async {
    await cubit.close();

    expect(userUseCase.controller.hasListener, isFalse);
    expect(skillsUseCase.controller.hasListener, isFalse);
    expect(projectsUseCase.controller.hasListener, isFalse);

    languageNotifier.changeLanguage(const Locale('uk'));
    expect(userUseCase.executions, 1, reason: 'a closed cubit must not resubscribe');
    expect(skillsUseCase.executions, 1);
    expect(projectsUseCase.executions, 1);
  });
}
