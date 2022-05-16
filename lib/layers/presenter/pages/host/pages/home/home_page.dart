import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/application/logger.dart';
import 'package:my_portfolio/layers/presenter/pages/host/pages/home/widgets/about_me/about_me.dart';
import 'package:my_portfolio/layers/presenter/pages/host/pages/home/widgets/intro/intro_page_desktop.dart';
import 'package:my_portfolio/layers/presenter/pages/host/pages/home/widgets/intro/intro_page_mobile.dart';
import 'package:my_portfolio/layers/presenter/pages/host/pages/home/widgets/services/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/widgets/behaviour/responsive_widget.dart';
import '../../../../common/widgets/footer/footer.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final InfoBloc _bloc = BlocProvider.of<InfoBloc>(context);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    String? locale = EasyLocalization.of(context)?.locale.languageCode;
    pLogger.i("HomePage-> didChangeDependencies $locale");
    _bloc.add(GetUserEvent(locale));
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoBloc, InfoState>(builder: (context, state) {
      return AnimatedOpacity(
          opacity: state.userModel != null ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ResponsiveWidget(
                  desktopScreen: IntroPageDesktop(
                    openCv: () => openCVAction(state.userModel?.cv),
                    colorScheme: Theme.of(context).colorScheme,
                    textTheme: Theme.of(context).textTheme,
                    userFullName: state.userModel?.name ?? "##### #####",
                    jobPosition: state.userModel?.position ?? "#####",
                  ),
                  mobileScreen: IntroPageMobile(
                    openCv: () => openCVAction(state.userModel?.cv),
                    colorScheme: Theme.of(context).colorScheme,
                    textTheme: Theme.of(context).textTheme,
                    userFullName: state.userModel?.name ?? "##### #####",
                    jobPosition: state.userModel?.position ?? "#####",
                    avatar: state.userModel?.avatar,
                  ),
                ),
                Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height / 2,
                      minWidth: double.infinity,
                    ),
                    child: AboutMe(
                      skills: state.userModel?.skills ?? [],
                      aboutMe: state.userModel?.intro ?? "",
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: const Services()),
                const AppFooter()
              ],
            ),
          ));
    });
  }

  void openCVAction(String? link) async {
    Uri? uri = Uri.tryParse(link ?? "");
    if (uri != null) {
      await canLaunchUrl(uri)
          ? await launchUrl(uri)
          : throw 'Could not launch $link';
    }
  }
}
