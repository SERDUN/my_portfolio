class AppRouterConfiguration {
  final String? colorCode;
  final bool unknown;
  final bool? loggedIn;

  AppRouterConfiguration.splash()
      : unknown = false,
        loggedIn = null,
        colorCode = null;

  AppRouterConfiguration.login()
      : unknown = false,
        loggedIn = false,
        colorCode = null;

  AppRouterConfiguration.shapeBorder(String? colorCode)
      : unknown = false,
        loggedIn = true,
        colorCode = colorCode;

  AppRouterConfiguration.color(String? colorCode)
      : unknown = false,
        loggedIn = true,
        colorCode = colorCode;

  AppRouterConfiguration.home()
      : unknown = false,
        loggedIn = true,
        colorCode = null;

  AppRouterConfiguration.unknown()
      : unknown = true,
        loggedIn = null,
        colorCode = null;

  bool get isUnknown => unknown == true;
  bool get isHomePage =>
      unknown == false && loggedIn == true && colorCode == null ;
  bool get isColorPage =>
      unknown == false && loggedIn == true && colorCode != null ;
  bool get isShapePage =>
      unknown == false && loggedIn == true && colorCode != null ;
  bool get isLoginPage => unknown == false && loggedIn == false;
  bool get isSplashPage => unknown == false && loggedIn == null;
}
