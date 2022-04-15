import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio/presenter/pages/home/services/services.dart';
import '../../../data/tmp_static_skills.dart';
import '../../common/widgets/behaviour/responsive_widget.dart';
import '../../common/widgets/footer/footer.dart';
import 'about_me/about_me.dart';
import 'intro/intro_page_desktop.dart';
import 'intro/intro_page_mobile.dart';

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
          const ResponsiveWidget(
            desktopScreen: IntroPageDesktop(),
            mobileScreen: IntroPageMobile(),
          ),
          AboutMe(
            skills: TmpStaicSkills.getSkills(),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 24), child: const Services()),
          const AppFooter()
        ],
      ),
    );
  }
}
