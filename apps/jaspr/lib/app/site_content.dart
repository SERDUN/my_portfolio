import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

import '../l10n/app_strings.g.dart';

/// Everything one language of the site renders from, read once at build time
/// through the same cubits the Flutter app drives.
class SiteContent {
  const SiteContent({
    required this.language,
    required this.strings,
    required this.shell,
    required this.contacts,
    required this.home,
    required this.projects,
    required this.projectPages,
  });

  final Language language;
  final AppStrings strings;
  final ShellState shell;
  final ContactsState contacts;
  final HomeState home;

  /// The projects page.
  final ProjectsState projects;

  /// One state per project page, by project id, in list order.
  final Map<String, ProjectState> projectPages;

  PortfolioUserModel get user => home.user!;
}

class _FixedLanguage implements LanguageSource {
  const _FixedLanguage(this.language);

  @override
  final Language language;

  @override
  Stream<Language> get languageChanges => const Stream.empty();
}

/// Loads every language through the shared cubits and waits until each has
/// what the pages need. A failure or a missing piece fails the build rather
/// than pre-rendering an error page.
Future<Map<Language, SiteContent>> loadSiteContent(AssetLoader assets) async {
  final source = AssetsDataSource(assets);
  final users = UserRepositoryImpl(source);
  final projects = ProjectRepositoryImpl(source);

  return {for (final language in Language.values) language: await _load(language, users: users, projects: projects)};
}

Future<SiteContent> _load(
  Language language, {
  required UserRepository users,
  required ProjectRepository projects,
}) async {
  final languages = _FixedLanguage(language);
  final shell = ShellCubit(GetUserUseCaseImpl(users), languages);
  final contacts = ContactsCubit(GetContactsUseCaseImpl(users), languages);
  final home = HomeCubit(
    GetUserUseCaseImpl(users),
    GetUserSkillsUseCaseImpl(users),
    GetProjectsUseCaseImpl(projects),
    languages,
  );
  final list = ProjectsCubit(GetProjectsUseCaseImpl(projects), languages);
  try {
    final projectsState = await _settle(
      list,
      (s) => s.status == LoadStatus.success && s.projects.isNotEmpty,
      '$language projects',
    );
    final projectPages = <String, ProjectState>{};
    for (final project in projectsState.projects) {
      final page = ProjectCubit(
        GetProjectByIdUseCaseImpl(projects),
        GetProjectsUseCaseImpl(projects),
        languages,
        project.id,
      );
      try {
        projectPages[project.id] = await _settle(
          page,
          (s) => s.status == LoadStatus.success && s.projects.isNotEmpty,
          '$language project ${project.id}',
        );
      } finally {
        await page.close();
      }
    }
    return SiteContent(
      language: language,
      strings: AppStrings.of(language.code),
      shell: await _settle(shell, (s) => s.user != null, '$language shell'),
      contacts: await _settle(contacts, (s) => s.status == LoadStatus.success, '$language contacts'),
      home: await _settle(
        home,
        (s) => s.status == LoadStatus.success && s.skills != null && s.projects.isNotEmpty,
        '$language home',
      ),
      projects: projectsState,
      projectPages: projectPages,
    );
  } finally {
    await Future.wait([shell.close(), contacts.close(), home.close(), list.close()]);
  }
}

/// The cubit's state once [done] holds; throws on a failure status or after
/// [timeout].
Future<S> _settle<S>(
  BlocBase<S> cubit,
  bool Function(S state) done,
  String what, {
  Duration timeout = const Duration(seconds: 30),
}) async {
  bool failed(S state) => switch (state) {
    HomeState(:final status) ||
    ContactsState(:final status) ||
    ProjectsState(:final status) ||
    ProjectState(:final status) => status == LoadStatus.failure,
    _ => false,
  };
  S check(S state) {
    if (failed(state)) throw StateError('$what failed to load: $state');
    return state;
  }

  if (done(cubit.state) || failed(cubit.state)) return check(cubit.state);
  final state = await cubit.stream
      .firstWhere((s) => done(s) || failed(s))
      .timeout(timeout, onTimeout: () => throw TimeoutException('$what did not load', timeout));
  return check(state);
}
