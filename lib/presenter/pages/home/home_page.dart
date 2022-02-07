import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:my_portfolio/presenter/pages/home/services/services.dart';
import 'package:my_portfolio/presenter/ui/menu/general_menu_bar.dart';

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
          Container(
            margin: EdgeInsets.only(top: 32, left: 32,bottom: 24),
            child: Text("Services",
                style: titleBlackBold),
          ),
          const Services()
        ],
      ),
    );
  }
}
