import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_breakpoints.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    this.desktopScreen,
    this.tabletScreen,
    this.mobileScreen,
  }) : super(key: key);

  final Widget? desktopScreen;
  final Widget? tabletScreen;
  final Widget? mobileScreen;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return desktopScreen ?? tabletScreen ?? mobileScreen!;
    }

    if (ResponsiveBreakpoints.of(context).isTablet) {
      return tabletScreen ?? desktopScreen ?? mobileScreen!;
    }

    //Mobile
    return mobileScreen ?? tabletScreen ?? desktopScreen!;
  }
}
