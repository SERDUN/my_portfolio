import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_portfolio/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app_environment_keys.dart';
import 'di/injection.dart';
import 'layers/data/tmp_static_data.dart';
import 'layers/domain/entity/model/model_project.dart';
import 'layers/domain/usecase/get_user_use_case.dart';
import 'layers/presenter/common/style/app_theme.dart';
import 'layers/presenter/pages/home/bloc/bloc.dart';
import 'layers/presenter/pages/home/bloc/event.dart';
import 'layers/presenter/pages/host_page/host_page.dart';
import 'layers/presenter/pages/portfollio/details/project_details_page.dart';

void main() async {
  await configureDependencies(AppEnvironmentKey.dev);

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
              return MultiBlocProvider(
                providers: [
                  BlocProvider<InfoBloc>(
                    create: (BuildContext context) =>
                        InfoBloc(di<GetUserUseCase>())..add(InitEvent()),
                  ),
                ],
                child: const HostPage(),
              );
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
