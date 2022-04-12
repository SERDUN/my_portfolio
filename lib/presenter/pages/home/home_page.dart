import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio/presenter/pages/home/services/services.dart';
import '../../ui/footer/footer.dart';
import 'about_me/about_me.dart';
import 'intro/intro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const IntroPage(),
          AboutMe(),
          Container(margin: const EdgeInsets.only(bottom: 24), child: Services()),
          const AppFooter()
        ],
      ),
    );
  }
}
