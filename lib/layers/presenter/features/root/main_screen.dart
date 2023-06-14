import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_route_consts.dart';
import '../../common/widgets/bars/common_app_bar.dart';
import '../bio/screen/home_page.dart';
import '../host_routes.dart';
import '../contact/screen/contact_page.dart';
import '../projects/screen/portfolio_page.dart';

class MainScreen extends StatefulWidget {
  final Widget screen;

  const MainScreen({
    Key? key,
    required this.screen,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map<String, Widget> searchRoutes = {
    HomeRoutes.intro.name: const HomePage(),
    HomeRoutes.contact.name: const ContactPage(),
    HomeRoutes.projects.name: const PortfolioPage(),
  };

  late HomeRoutes defaultPage;

  @override
  void initState() {
    defaultPage = HomeRoutes.contact;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        defaultPage: defaultPage,
        onHome: () {
          context.goNamed(AppRoutInfo.resume.name);
        },
        onPortfolio: () {
          context.goNamed(AppRoutInfo.portfolio.name);
        },
        onContact: () {
          context.goNamed(AppRoutInfo.contacts.name);
        },
      ),
      backgroundColor: Colors.white54,
      body: widget.screen,
    );
  }
}
