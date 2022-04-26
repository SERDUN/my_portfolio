import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/navigation/navigation_cubit.dart';
import '../../common/widgets/bars/common_app_bar.dart';
import '../contact/contact_page.dart';
import '../home/home_page.dart';
import '../portfollio/projects/portfolio_page.dart';
import 'navigation/fade_move_rout.dart';
import 'navigation/host_navigator.dart';
import 'navigation/host_routes.dart';

class HostPage extends StatefulWidget {
  final HomeRoutes defaultPage;

  const HostPage({Key? key, this.defaultPage = HomeRoutes.intro})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HostPage> {
  // GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  Map<String, Widget> searchRoutes = {
    HomeRoutes.intro.name: const HomePage(),
    HomeRoutes.contact.name: const ContactPage(),
    HomeRoutes.projects.name: const PortfolioPage(),
  };

  late HomeRoutes defaultPage;

  @override
  void initState() {
    defaultPage = widget.defaultPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          defaultPage: defaultPage,
          onHome: () {
            BlocProvider.of<NavigationCubit>(context).openIntro();
          },
          onPortfolio: () {
            BlocProvider.of<NavigationCubit>(context).openProjects();
          },
          onContact: () {
            BlocProvider.of<NavigationCubit>(context).openContact();

            // navKey.currentState?.pushReplacementNamed(HomeRoutes.contact.name);
          },
        ),
        backgroundColor: Colors.white54,
        body: searchRoutes[defaultPage.name]

        // Navigator(
        //   key: navKey,
        //   initialRoute: defaultPage.name,
        //   onGenerateRoute: getProfileRoutes,
        // ),
        );
  }

  Route<BuildContext>? getProfileRoutes(RouteSettings settings) {
    final Widget? child =
        searchRoutes[settings.name] ?? searchRoutes[HomeRoutes.intro];
    if (child != null) {
      return FadeMovePageRout(
        settings: settings,
        builder: (context) {
          if (settings.name != HomeRoutes.intro.name) {
            return child;
          } else {
            return child;
          }
        },
      );
    }
    return null;
  }
}
