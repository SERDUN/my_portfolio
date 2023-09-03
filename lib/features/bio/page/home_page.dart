import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

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
    _bloc.add(GetUserEvent(locale));
    _bloc.add(GetUserSkillsEvent());
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoBloc, InfoState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state.userModel != null ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 64,
                      ),
                      NameIntro(
                        fullName: state.userModel?.name,
                      ),
                      ButtonOutline(
                        text: tr("button_download_cv"),
                        onTap: () => openCVAction(state.userModel!.cv),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height / 2,
                      minWidth: double.infinity,
                    ),
                    child: AboutMe(
                      skills: state.skills ?? [],
                      aboutMe: state.userModel?.intro ?? "",
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  void openCVAction(String? link) async {
    Uri? uri = Uri.tryParse(link ?? "");
    if (uri != null) {
      await canLaunchUrl(uri) ? await launchUrl(uri) : throw 'Could not launch $link';
    }
  }
}