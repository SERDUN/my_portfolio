class HomeRoutePath {
  final String? pathName;
  final bool isUnkown;

  HomeRoutePath.home()
      : pathName = null,
        isUnkown = false;

  HomeRoutePath.otherPage(this.pathName) : isUnkown = false;

  HomeRoutePath.unKown()
      : pathName = null,
        isUnkown = true;

  bool get isHomePage => pathName == null;
  bool get isOtherPage => pathName != null;
}
