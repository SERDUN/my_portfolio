import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router_configuration.dart';
import 'navigation_cubit_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationState([
          //HomePage({}),
          AppRouterConfiguration(location: '/')
        ]));

  void push(AppRouterConfiguration appRouterConfiguration) {
    // print('push called with $path and $args');
    // AppRouterConfiguration config =
    //     AppRouterConfiguration(location: path, args: args);
    emit(state.push(appRouterConfiguration));
  }

  void openProjectDetails(int? id) =>
      push(AppRouterConfiguration(location: "/projects?id=$id"));

  void openContact() => emit(state
      .replace(AppRouterConfiguration(location: "/contact", name: "contact")));

  void openProjects() => emit(state.replace(
      AppRouterConfiguration(location: "/projects", name: "projects")));

  void openIntro() =>
      emit(state.replace(AppRouterConfiguration(location: "/", name: "intro")));

  void pop() {
    emit(state.pop());
  }

  void popOrProjects() {
    if (canPop())
      emit(state.pop());
    else
      openProjects();
  }

  bool canPop() {
    return state.canPop();
  }

  void clearAndPush(AppRouterConfiguration configuration) {
    emit(state.clearAndPush(configuration));
  }

  void replace(AppRouterConfiguration configuration) {
    emit(state.replace(configuration));
  }

//
// void clearAndPush(String path, [Map<String, dynamic>? args]) {
//   PageConfig config = PageConfig(location: path, args: args);
//   emit(state.clearAndPush(config));
//}
//
// void pop() {
//   emit(state.pop());
// }
//
// bool canPop() {
//   return state.canPop();
// }
//
// void pushBeneathCurrent(String path, [Map<String, dynamic>? args]) {
//   final PageConfig config = PageConfig(location: path, args: args);
//   emit(state.pushBeneathCurrent(config));
// }
}
