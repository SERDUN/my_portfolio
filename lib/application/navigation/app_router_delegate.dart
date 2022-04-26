import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/application/navigation/pages/home_page.dart';
import 'package:my_portfolio/layers/presenter/pages/host_page/navigation/host_routes.dart';
import 'package:my_portfolio/layers/presenter/pages/portfollio/details/bloc/bloc.dart';
import 'app_router_configuration.dart';
import 'navigation_cubit.dart';
import 'navigation_cubit_state.dart';
import 'pages/unknown_page.dart';

class AppRouterDelegate extends RouterDelegate<AppRouterConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<AppRouterConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final NavigationCubit _navigationCubit;

  AppRouterDelegate(this._navigationCubit);

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  AppRouterConfiguration? get currentConfiguration =>
      _navigationCubit.state.last;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, NavigationState>(
      builder: (context, stack) => Navigator(
        pages: stack.pages,
        onPopPage: (route, result) => _onPopPage.call(route, result),
      ),
      listener: (context, stack) => notifyListeners(),
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    print("_onPopPage");

    final didPop = route.didPop(result);
    if (!didPop) {
      print("_onPopPage return false;");

      return false;
    }

    if (_navigationCubit.canPop()) {
      _navigationCubit.pop();
      print("navigationCubit.canPop()");

      return true;
    } else {
      print("POP false");
      // if (_navigationCubit.state.last.name == "/projects") {
      //   _navigationCubit.push(AppRouterConfiguration(location: '/projects'));
      //   return true;
      //
      // }
      return false;
    }
  }

  @override
  Future<void> setNewRoutePath(AppRouterConfiguration configuration) async {
    print("Def1: " + (configuration.toString() ?? ""));
    if ((configuration.route ?? "").contains(HomeRoutes.projects.name) ||
        (configuration.route ?? "").contains(HomeRoutes.contact.name)) {
      print("clearAndPush");
      _navigationCubit.clearAndPush(configuration);
    } else if (configuration.route != '/' &&
        !((configuration.route).contains(HomeRoutes.intro.name))) {
      print("push");

      _navigationCubit.push(configuration);
    }
  }
}
