import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget? desktopScreen;
  final Widget? tabletScreen;
  final Widget? mobileScreen;

  const ResponsiveWidget(
      {Key? key, this.desktopScreen, this.tabletScreen, this.mobileScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWrapper.of(context).isDesktop) {
      return desktopScreen ?? tabletScreen ?? mobileScreen!;
    }

    if (ResponsiveWrapper.of(context).isTablet) {
      return tabletScreen ?? desktopScreen  ?? mobileScreen!;
    }

    //Mobile
    return mobileScreen ?? tabletScreen ?? desktopScreen!;
  }
}
