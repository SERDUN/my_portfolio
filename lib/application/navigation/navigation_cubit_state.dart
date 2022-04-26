import 'package:flutter/material.dart';
import 'package:my_portfolio/application/navigation/pages/base_page.dart';
import 'package:my_portfolio/application/navigation/pages/home_page.dart';

import 'app_router_configuration.dart';

class NavigationState {
  final List<AppRouterConfiguration> currentStack;

  AppRouterConfiguration get last => currentStack.last;

  NavigationState(this.currentStack);

  List<BasePage> get pages =>
      List.unmodifiable(currentStack.map((e) => e.page));

  NavigationState push(AppRouterConfiguration config) {
    if (currentStack.last != config) currentStack.add(config);
    return NavigationState(currentStack);
  }

  NavigationState replace(AppRouterConfiguration config) {
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

  NavigationState clearAndPush(AppRouterConfiguration config) {
    print("Def: " + (config?.name ?? ""));

    currentStack.clear();
    currentStack.add(config);
    return NavigationState(currentStack);
  }
}
