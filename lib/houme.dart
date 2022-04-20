import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/injection.dart';
import 'home_route_path.dart';
import 'layers/domain/usecase/projects/get_projects_use_case.dart';
import 'layers/domain/usecase/user/get_user_use_case.dart';
import 'layers/presenter/pages/home/bloc/bloc.dart';
import 'layers/presenter/pages/home/bloc/event.dart';
import 'layers/presenter/pages/home/home_page.dart';
import 'layers/presenter/pages/host_page/host_page.dart';
import 'layers/presenter/pages/portfollio/projects/bloc/bloc.dart';
import 'layers/presenter/pages/portfollio/projects/bloc/event.dart';

class HomeRouterDelegate extends RouterDelegate<HomeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<HomeRoutePath> {
  String? pathName;
  bool isError = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  HomeRoutePath get currentConfiguration {
    if (isError) return HomeRoutePath.unKown();

    if (pathName == null) return HomeRoutePath.home();

    return HomeRoutePath.otherPage(pathName);
  }

  void onTapped(String path) {
    pathName = path;
    print(pathName);
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,

        pages: [
          MaterialPage(
            key: ValueKey('HomePage'),
            child:MultiBlocProvider(
              providers: [
                BlocProvider<InfoBloc>(
                  create: (BuildContext context) =>
                  InfoBloc(di<GetUserUseCase>())..add(InitEvent()),
                ),
                BlocProvider<ProjectsBloc>(
                  create: (BuildContext context) =>
                  ProjectsBloc(di<GetProjectsUseCase>())
                    ..add(InitProjectsEvent()),
                ),
              ],
              child: const HostPage(),
            )
          ),
          if (isError)
            MaterialPage(key: ValueKey('UnknownPage'), child: Container(child: Text("Error"),))
          else if (pathName != null)
            MaterialPage(
                key: ValueKey(pathName),
                child: Container(child: Text("good")))
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;

          pathName = null;
          isError = false;
          notifyListeners();

          return true;
        });
  }

  @override
  Future<void> setNewRoutePath(HomeRoutePath homeRoutePath) async {
    if (homeRoutePath.isUnkown) {
      pathName = null;
      isError = true;
      return;
    }

    if (homeRoutePath.isOtherPage) {
      if (homeRoutePath.pathName != null) {
        pathName = homeRoutePath.pathName;
        isError = false;
        return;
      } else {
        isError = true;
        return;
      }
    } else {
      pathName = null;
    }
  }
}
