import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:my_portfolio/layers/presenter/pages/home/bloc/state.dart';
import 'package:my_portfolio/layers/presenter/pages/home/widgets/about_me/about_me.dart';
import 'package:my_portfolio/layers/presenter/pages/home/widgets/intro/intro_page_desktop.dart';
import 'package:my_portfolio/layers/presenter/pages/home/widgets/intro/intro_page_mobile.dart';
import 'package:my_portfolio/layers/presenter/pages/home/widgets/services/services.dart';

import '../../../../main.dart';
import '../../common/widgets/behaviour/responsive_widget.dart';
import '../../common/widgets/footer/footer.dart';
import 'bloc/bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    pLogger.log(Level.debug, "HomePage: create state");

    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late InfoBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<InfoBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoBloc, InfoState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ResponsiveWidget(
              desktopScreen: IntroPageDesktop(
                userModel: state.userModel,
                colorScheme: Theme.of(context).colorScheme,
                textTheme: Theme.of(context).textTheme,
              ),
              mobileScreen: IntroPageMobile(
                userModel: state.userModel,
              ),
            ),
            Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height / 2,
                  minWidth: double.infinity,
                ),
                child: AnimatedOpacity(
                    opacity: state.userModel?.skills != null ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    // The green box must be a child of the AnimatedOpacity widget.
                    child: AboutMe(
                      skills: state.userModel?.skills ?? [],
                      aboutMe: state.userModel?.intro ?? "",
                    ))),
            Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: const Services()),
            const AppFooter()
          ],
        ),
      );
    });
  }
}
