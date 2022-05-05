import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/layers/presenter/pages/home/host/host_routes.dart';

import 'navigation_router_configuration.dart';
import 'state/navigation_cubit.dart';
import 'state/navigation_cubit_state.dart';

class NavigationRouterDelegate
    extends RouterDelegate<NavigationRouterConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<NavigationRouterConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final NavigationCubit _navigationCubit;

  NavigationRouterDelegate(this._navigationCubit);

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  NavigationRouterConfiguration? get currentConfiguration =>
      _navigationCubit.state.last;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NavigationCubit, NavigationState>(
      builder: (context, stack) => Navigator(
        pages: stack.pages,
        onPopPage: (route, result) => _onPopPage.call(route, result),
      ),
      listener: (context, stack) {
        notifyListeners();
      },
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    if (_navigationCubit.canPop()) {
      _navigationCubit.pop();
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> setNewRoutePath(
      NavigationRouterConfiguration configuration) async {
    if ((configuration.route).contains(HomeRoutes.projects.name) ||
        (configuration.route).contains(HomeRoutes.contact.name)) {
      _navigationCubit.clearAndPush(configuration);
    } else if (configuration.route != '/' &&
        !((configuration.route).contains(HomeRoutes.intro.name))) {
      _navigationCubit.push(configuration);
    }
  }
}
