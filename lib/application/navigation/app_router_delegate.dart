import 'package:flutter/material.dart';
import 'package:my_portfolio/application/navigation/pages/home_page.dart';
import 'app_router_configuration.dart';
import 'pages/unknown_page.dart';


class AppRouterDelegate extends RouterDelegate<AppRouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRouterConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  bool? _show404;
  bool? get show404 => _show404;
  set show404(bool? value) {
    _show404 = value;
    if (value == true) {
      selectedColorCode = null;
    }
    notifyListeners();
  }

  bool? _loggedIn;
  bool? get loggedIn => _loggedIn;
  set loggedIn(value) {
    if (_loggedIn == true && value == false) {
      // It is a logout!
      _clear();
    }
    _loggedIn = value;
    notifyListeners();
  }

  List<Color>? _colors;
  List<Color>? get colors => _colors;
  set colors(List<Color>? value) {
    // _colors = value;
    // final selectedColorCode = this.selectedColorCode;
    // if (value != null && selectedColorCode != null) {
    //   show404 = !_isValidColor(value, selectedColorCode);
    // }
    // notifyListeners();
  }

  String? _selectedColorCode;
  String? get selectedColorCode => _selectedColorCode;
  set selectedColorCode(String? value) {
    // final colors = this.colors;
    // if (colors != null && value != null) {
    //   show404 = !_isValidColor(colors, value);
    // }
    // _selectedColorCode = value;
    // notifyListeners();
  }


  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  AppRouterDelegate() {
    _init();
  }

  _init() async {

  }

  @override
  AppRouterConfiguration? get currentConfiguration {
    if (loggedIn == false) {
      return AppRouterConfiguration.login();
    } else if (loggedIn == null) {
      return AppRouterConfiguration.splash();
    } else if (show404 == true) {
      return AppRouterConfiguration.unknown();
    } else if (selectedColorCode == null) {
      return AppRouterConfiguration.home();
    }
    // else if (selectedShapeBorderType == null) {
    //   return AppRouterConfiguration.color(selectedColorCode);
    // } else if (selectedShapeBorderType != null) {
    //   return AppRouterConfiguration.shapeBorder(selectedColorCode, selectedShapeBorderType);
    // } else {
      return null;

  }

  @override
  Widget build(BuildContext context) {
    List<Page> stack;
    final loggedIn = this.loggedIn;
    final colors = this.colors;
    if (show404 == true) {
      stack = _unknownStack;
    } else if (loggedIn == null || (loggedIn && colors == null)) {
      stack = _splashStack;
    } else if (loggedIn && colors != null) {
      stack = _loggedInStack(colors);
    } else {
      stack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        // if (selectedShapeBorderType == null) selectedColorCode = null;
        // selectedShapeBorderType = null;
        return true;
      },
    );
  }

  List<Page> get _splashStack {
    String? process;
    if (loggedIn == null) {
      process = 'Checking login state...';
    } else if (colors == null) {
      process = 'Fetching colors...';
    } else {
      process = "Unidentified process";
    }
    return [
      //SplashPage(process: process),
    ];
  }

  List<Page> get _unknownStack => [const UnknownPage()];

  List<Page> get _loggedOutStack => [
        // LoginPage(onLogin: () async {
        //   loggedIn = true;
        //   colors = await colorsRepository.fetchColors();
        // })
      ];

  List<Page> _loggedInStack(List<Color> colors) {

    return [
      HomePage(),
    ];
  }

  @override
  Future<void> setNewRoutePath(AppRouterConfiguration configuration) async {
    if (configuration.unknown) {
      show404 = true;
    } else if (configuration.isHomePage ||
        configuration.isLoginPage ||
        configuration.isSplashPage) {
      show404 = false;
      selectedColorCode = null;
    } else if (configuration.isColorPage) {
      show404 = false;
      selectedColorCode = configuration.colorCode;
    } else if (configuration.isShapePage) {
      show404 = false;
      selectedColorCode = configuration.colorCode;
    } else {
      print(' Could not set new route');
    }
  }

  _clear() {
    selectedColorCode = null;
    colors = null;
    show404 = null;
  }


}
