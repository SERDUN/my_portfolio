import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/bars/common_app_bar.dart';
import '../../../navigation/state/navigation_cubit.dart';
import '../../contact/contact_page.dart';
import '../../portfolio/projects/portfolio_page.dart';
import '../home_page.dart';
import 'host_routes.dart';

class HostPage extends StatefulWidget {
  final HomeRoutes defaultPage;

  const HostPage({Key? key, this.defaultPage = HomeRoutes.intro})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HostPage> {
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
          },
        ),
        backgroundColor: Colors.white54,
        body: searchRoutes[defaultPage.name]);
  }
}
