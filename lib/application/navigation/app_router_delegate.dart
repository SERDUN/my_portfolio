import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/application/navigation/pages/home_page.dart';
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
  Future<void> setNewRoutePath(AppRouterConfiguration configuration) async {
    if (configuration.route != '/') {
      _navigationCubit.push(configuration.route, configuration.args);
    }
  }
}
