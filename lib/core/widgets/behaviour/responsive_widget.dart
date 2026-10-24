import 'package:material_ui/material_ui.dart';

import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    this.desktopScreen,
    this.tabletScreen,
    this.mobileScreen,
  });

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
