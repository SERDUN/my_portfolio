import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

/// Every use case the router hands to a page, resolved once. The app root
/// fills it from the container; widget tests fill it with fakes. Adding a use
/// case means adding a field here, and both places get it from one list.
class AppUseCases {
  const AppUseCases({
    required this.getUser,
    required this.getUserSkills,
    required this.getContacts,
    required this.getProjects,
    required this.getProjectById,
    required this.getUsefulCommands,
  });

  final GetUserUseCase getUser;
  final GetUserSkillsUseCase getUserSkills;
  final GetContactsUseCase getContacts;
  final GetProjectsUseCase getProjects;
  final GetProjectByIdUseCase getProjectById;
  final GetUsefulCommandsUseCase getUsefulCommands;

  List<RepositoryProvider<Object>> get providers => [
    RepositoryProvider<GetUserUseCase>.value(value: getUser),
    RepositoryProvider<GetUserSkillsUseCase>.value(value: getUserSkills),
    RepositoryProvider<GetContactsUseCase>.value(value: getContacts),
    RepositoryProvider<GetProjectsUseCase>.value(value: getProjects),
    RepositoryProvider<GetProjectByIdUseCase>.value(value: getProjectById),
    RepositoryProvider<GetUsefulCommandsUseCase>.value(value: getUsefulCommands),
  ];
}
