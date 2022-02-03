// import 'package:flutter/cupertino.dart';
//
// import 'host_navigator.dart';
// import 'host_routes.dart';
//
// class HomeObserver extends NavigatorObserver {
//   final List<String> _routeHistory = [];
//
//   @override
//   void didPush(Route route, Route? previousRoute) {
//     if(route.settings.name != null) {
//       _routeHistory.add(route.settings.name!);
//     }
//     if(previousRoute?.settings.name == HomeRoutes.root) {
//       HomeNavigator.homeKey.currentState?.onLeavePage();
//     }
//     super.didPush(route, previousRoute);
//   }
//
//   @override
//   void didPop(Route route, Route? previousRoute) {
//     if(_routeHistory.isNotEmpty) {
//       _routeHistory.removeLast();
//     }
//     if(route.settings.name == HomeRoutes.search) {
//       var context = route.navigator?.context;
//       if(context != null) {
//         context.findAncestorStateOfType<HomeTabState>()?.searchKey.currentState?.controller.clear();
//         FocusScope.of(context).unfocus();
//       }
//     }
//     if(previousRoute?.settings.name == HomeRoutes.root) {
//       HomeNavigator.homeKey.currentState?.onEnterPage();
//     }
//     super.didPop(route, previousRoute);
//   }
//
//   @override
//   void didRemove(Route route, Route? previousRoute) {
//     var beginIndex = _routeHistory.indexOf(route.settings.name ?? '');
//     var endIndex = previousRoute != null ? _routeHistory.indexOf(previousRoute.settings.name ?? '') : -1;
//     if((endIndex == -1 && beginIndex != -1) || beginIndex - 1 == endIndex) {
//       _routeHistory.remove(route.settings.name);
//     } else if(endIndex != -1 && beginIndex != -1) {
//       _routeHistory.removeRange(beginIndex,endIndex);
//     }
//     super.didRemove(route, previousRoute);
//   }
//
//   @override
//   void didReplace({Route? newRoute, Route? oldRoute}) {
//     if(oldRoute?.settings.name != null && newRoute?.settings.name != null) {
//       if(_routeHistory.contains(oldRoute!.settings.name)) {
//         _routeHistory[_routeHistory.indexOf(oldRoute.settings.name!)] = newRoute!.settings.name!;
//       }
//     }
//     super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
//   }
//
//   bool containsRoute(String route) => _routeHistory.contains(route);
//   String currentRoute() => _routeHistory.isEmpty ? '/' : _routeHistory.last;
// }