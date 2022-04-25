import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router_configuration.dart';
import 'navigation_cubit_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationState([
          //HomePage({}),
          AppRouterConfiguration(location: '/')
        ]));

  void push(String path, [Map<String, dynamic>? args]) {
    print('push called with $path and $args');
    AppRouterConfiguration config =
        AppRouterConfiguration(location: path, args: args);
    emit(state.push(config));
  }

  void openProjectDetails() => push("/project");


  void pop() {
    emit(state.pop());
  }

  bool canPop() {
    return state.canPop();
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
