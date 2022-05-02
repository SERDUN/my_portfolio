import 'dart:ui';

import 'package:logger/logger.dart';
import 'package:my_portfolio/layers/presenter/navigation/common/pages/base_page.dart';

import '../../../../main.dart';
import '../navigation_router_configuration.dart';

class NavigationState {
  final List<NavigationRouterConfiguration> currentStack;

  NavigationRouterConfiguration get last => currentStack.last;

  NavigationState(this.currentStack);

  List<BasePage> get pages =>
      List.unmodifiable(currentStack.map((e) => e.page));

  NavigationState push(NavigationRouterConfiguration config) {
    if (currentStack.last != config) currentStack.add(config);
    return NavigationState(currentStack);
  }

  NavigationState replace(NavigationRouterConfiguration config) {
    if (canPop()) {
      currentStack.removeLast();
      push(config);
    } else {
      currentStack.insert(0, config);
      currentStack.removeLast();
    }
    return NavigationState(currentStack);
  }

  bool canPop() {
    return currentStack.length > 1;
  }

  NavigationState pop() {
    if (canPop()) currentStack.remove(currentStack.last);
    return NavigationState(currentStack);
  }

  NavigationState nothing(Locale locale) {
    return NavigationState(currentStack);
  }

  NavigationState clearAndPush(NavigationRouterConfiguration config) {
    currentStack.clear();
    currentStack.add(config);
    return NavigationState(currentStack);
  }
}
