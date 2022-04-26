import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation_router_configuration.dart';
import 'navigation_cubit_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationState([NavigationRouterConfiguration(location: '/')]));

  void push(NavigationRouterConfiguration appRouterConfiguration) =>
      emit(state.push(appRouterConfiguration));

  void pop() => emit(state.pop());

  bool canPop() => state.canPop();

  void clearAndPush(NavigationRouterConfiguration configuration) =>
      emit(state.clearAndPush(configuration));

  void replace(NavigationRouterConfiguration configuration) =>
      emit(state.replace(configuration));

  void openProjectDetails(int? id) => push(_config("projects/$id"));

  void openContact() => emit(state.replace(_config("contact")));

  void openProjects() => emit(state.replace(_config("projects")));

  void openIntro() => emit(state.replace(_config("")));

  void popOrProjects() => canPop() ? emit(state.pop()) : openProjects();

  void replaceToIntro() => clearAndPush(_config(""));

  void replaceToContact() => clearAndPush(_config("contact"));

  NavigationRouterConfiguration _config(String path) =>
      NavigationRouterConfiguration(location: "/$path");
}
