import 'package:flutter/material.dart';
import 'package:my_portfolio/presenter/pages/host_page/host_page.dart';
import 'package:my_portfolio/presenter/pages/portfollio/details/project_details_page.dart';
import 'package:my_portfolio/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'data/tmp_static_data.dart';
import 'domain/entity/model/model_project.dart';
import 'presenter/common/style/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          debugLog: true,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(320, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScaleDown(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Routes.home:
            return Routes.fadeThrough(settings, (context) {
              return const HostPage();
            });

          case Routes.projectDetails:
            return Routes.fadeThrough(settings, (context) {
              return ProjectDetailsPage(
                project: settings.arguments == null
                    ? TmpStaticData.getProjects().first
                    : settings.arguments as ModelProject,
              );
            });
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
