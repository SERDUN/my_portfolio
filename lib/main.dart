import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:my_portfolio/application/navigation/navigation_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'app_environment_keys.dart';
import 'application/navigation/app_route_information_parser.dart';
import 'application/navigation/app_router_delegate.dart';
import 'di/injection.dart';
import 'layers/domain/usecase/projects/get_project_by_id_use_case.dart';
import 'layers/domain/usecase/projects/get_projects_use_case.dart';
import 'layers/domain/usecase/user/get_user_use_case.dart';
import 'layers/presenter/common/style/app_theme.dart';
import 'layers/presenter/pages/home/bloc/bloc.dart';
import 'layers/presenter/pages/home/bloc/event.dart';
import 'layers/presenter/pages/portfollio/details/bloc/bloc.dart';
import 'layers/presenter/pages/portfollio/projects/bloc/bloc.dart';
import 'layers/presenter/pages/portfollio/projects/bloc/event.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());

  Uri result = Uri.parse("http://localhost:54722/1/project");
  var r=result.hasQuery;


  await configureDependencies(AppEnvironmentKey.dev);
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NavigationCubit>(
      create: (BuildContext context) => NavigationCubit(),
    ),
    BlocProvider<InfoBloc>(
      create: (BuildContext context) =>
          InfoBloc(di<GetUserUseCase>())..add(InitEvent()),
    ),
    BlocProvider<ProjectsBloc>(
      create: (BuildContext context) =>
          ProjectsBloc(di<GetProjectsUseCase>())..add(InitProjectsEvent()),
    ),
    BlocProvider<ProjectDetailsBloc>(
      create: (BuildContext context) =>
          ProjectDetailsBloc(di<GetProjectByIdUseCase>()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Dmitro Serdun",
      theme: CustomTheme.lightTheme,
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          debugLog: false,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(320, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
            const ResponsiveBreakpoint.resize(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouterDelegate(BlocProvider.of(context)),
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}
