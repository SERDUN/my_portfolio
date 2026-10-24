import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/state/state.dart';
import 'package:my_portfolio/features/project/bloc/project_cubit.dart';
import 'package:my_portfolio/app/settings/settings.dart';

class _FakeById implements GetProjectByIdUseCase {
  final controller = StreamController<ProjectModel>.broadcast();
  final List<String> ids = [];

  @override
  Stream<ProjectModel> execute({required String id, required Language language}) {
    ids.add(id);
    return controller.stream;
  }
}

class _FakeList implements GetProjectsUseCase {
  final controller = StreamController<List<ProjectModel>>.broadcast();

  @override
  Stream<List<ProjectModel>> execute({required Language language}) => controller.stream;
}

ProjectModel _project(String id) => ProjectModel(id: id, name: 'P$id');

void main() {
  late _FakeById byId;
  late _FakeList list;
  late AppSettingsCubit settings;
  late ProjectCubit cubit;

  setUp(() {
    byId = _FakeById();
    list = _FakeList();
    settings = AppSettingsCubit();
    cubit = ProjectCubit(byId, list, settings, '1');
  });

  tearDown(() async {
    await cubit.close();
    await settings.close();
    await byId.controller.close();
    await list.controller.close();
  });

  test('loads the project by its route id', () async {
    expect(cubit.state.status, LoadStatus.loading);
    expect(byId.ids, ['1']);

    byId.controller.add(_project('1'));
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.status, LoadStatus.success);
    expect(cubit.state.project?.id, '1');
  });

  test('an unknown id is a not-found failure, other errors are not', () async {
    byId.controller.addError(const ProjectNotFoundException('1'));
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.isNotFound, isTrue);

    cubit.load();
    byId.controller.addError(Exception('offline'));
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.status, LoadStatus.failure);
    expect(cubit.state.isNotFound, isFalse);
  });

  test('a transient StateError is a retryable failure, not a missing project', () async {
    byId.controller.addError(StateError('Bad state'));
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.status, LoadStatus.failure);
    expect(cubit.state.isNotFound, isFalse);
  });

  test('a project missing after a language switch is dropped, not kept stale', () async {
    byId.controller.add(_project('1'));
    await Future<void>.delayed(Duration.zero);

    cubit.load();
    byId.controller.addError(const ProjectNotFoundException('1'));
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.isNotFound, isTrue);
    expect(cubit.state.project, isNull);
  });

  test('a list error leaves the project and only hides the next link', () async {
    byId.controller.add(_project('1'));
    list.controller.addError(Exception('list down'));
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.status, LoadStatus.success);
    expect(cubit.state.nextProject, isNull);
  });

  test('next project wraps around the list', () async {
    byId.controller.add(_project('3'));
    list.controller.add([_project('1'), _project('2'), _project('3')]);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.nextProject?.id, '1');
  });
}
