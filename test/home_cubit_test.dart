import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';
import 'package:my_portfolio/features/home/bloc/home_cubit.dart';
import 'package:my_portfolio/app/settings/settings.dart';

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
  final controller = StreamController<List<SkillGroupModel>>.broadcast();
  int executions = 0;

  @override
  Stream<List<SkillGroupModel>> execute({required Language language}) {
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

final user = PortfolioUserModel(firstName: 'Dmitro', secondName: 'Serdun', position: 'Mobile Developer', intro: 'Hi');

final skills = [SkillGroupModel(title: 'Flutter')];

ProjectModel project(String id, {bool featured = false, String? preview, ProjectPlatform? platform}) => ProjectModel(
  id: id,
  name: 'Project $id',
  preview: preview == null ? null : Uri.parse('https://img.example/$preview.png'),
  featured: featured,
  platform: platform,
);

void main() {
  late FakeGetUserUseCase userUseCase;
  late FakeGetUserSkillsUseCase skillsUseCase;
  late FakeGetProjectsUseCase projectsUseCase;
  late AppSettingsCubit settings;
  late HomeCubit cubit;

  setUp(() {
    userUseCase = FakeGetUserUseCase();
    skillsUseCase = FakeGetUserSkillsUseCase();
    projectsUseCase = FakeGetProjectsUseCase();
    settings = AppSettingsCubit();
    cubit = HomeCubit(userUseCase, skillsUseCase, projectsUseCase, settings);
  });

  tearDown(() async {
    await cubit.close();
    await settings.close();
    await userUseCase.controller.close();
    await skillsUseCase.controller.close();
    await projectsUseCase.controller.close();
  });

  test('starts loading and subscribes to all three use cases', () {
    expect(cubit.state, const HomeState(status: LoadStatus.loading));
    expect(cubit.state.user, isNull);
    expect(cubit.state.skills, isNull);
    expect(cubit.state.projects, isEmpty);
    expect(userUseCase.executions, 1);
    expect(skillsUseCase.executions, 1);
    expect(projectsUseCase.executions, 1);
  });

  test('emits success with the user, then merges the skills in', () async {
    final states = <HomeState>[];
    final subscription = cubit.stream.listen(states.add);

    userUseCase.controller.add(user);
    await Future<void>.delayed(Duration.zero);
    skillsUseCase.controller.add(skills);
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();

    expect(states, [
      HomeState(status: LoadStatus.success, user: user),
      HomeState(status: LoadStatus.success, user: user, skills: skills),
    ]);
  });

  test('does not emit when the stream repeats the same data', () async {
    final states = <HomeState>[];
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
      project('1', platform: ProjectPlatform.flutter),
      project('2', platform: ProjectPlatform.android),
      project('3', platform: ProjectPlatform.flutter),
      project('4'),
    ]);
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.platformCount, 2);
  });

  test('resubscribes to all use cases with the new language when it changes', () async {
    settings.changeLanguage(Language.uk);
    await Future<void>.delayed(Duration.zero);

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

    settings.changeLanguage(Language.uk);
    await Future<void>.delayed(Duration.zero);
    expect(userUseCase.executions, 1, reason: 'a closed cubit must not resubscribe');
    expect(skillsUseCase.executions, 1);
    expect(projectsUseCase.executions, 1);
  });

  group('errors', () {
    test('a profile error fails the page and reaches addError', () async {
      // Bloc reads the observer when a cubit is built, so build one after setting it.
      final observer = _RecordingObserver();
      final previous = Bloc.observer;
      Bloc.observer = observer;
      addTearDown(() => Bloc.observer = previous);
      final observed = HomeCubit(userUseCase, skillsUseCase, projectsUseCase, settings);
      addTearDown(observed.close);
      final error = StateError('offline');

      userUseCase.controller.addError(error);
      await Future<void>.delayed(Duration.zero);

      expect(observed.state.status, LoadStatus.failure);
      expect(observed.state.error, error);
      expect(observer.errors, contains(error));
    });

    test('a skills error clears the skills but keeps the page', () async {
      userUseCase.controller.add(user);
      skillsUseCase.controller.add(skills);
      await Future<void>.delayed(Duration.zero);
      skillsUseCase.controller.addError(Exception('skills down'));
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.status, LoadStatus.success);
      expect(cubit.state.user, user);
      expect(cubit.state.skills, isNull, reason: 'stale skills from another language must not stay');
    });

    test('load after a failure goes back to loading and resubscribes', () async {
      userUseCase.controller.addError(Exception('offline'));
      await Future<void>.delayed(Duration.zero);

      cubit.load();

      expect(cubit.state.status, LoadStatus.loading);
      expect(cubit.state.error, isNull);
      expect(userUseCase.executions, 2);
    });
  });
}

/// Records what reaches [BlocObserver.onError], i.e. what `addError` reports.
class _RecordingObserver extends BlocObserver {
  final List<Object> errors = [];

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    errors.add(error);
    super.onError(bloc, error, stackTrace);
  }
}
