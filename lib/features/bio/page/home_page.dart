import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/features/bio/bloc/bio_cubit.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

import '../../../main.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final BioCubit _bloc = BlocProvider.of<BioCubit>(context);

  @override
  void initState() {
    LanguageProvider.read(context)?.languageNotifier.addListener(() {
      _bloc.subscribeOnUserData();
      _bloc.subscribeOnUserSkills();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BioCubit, BioState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state.user != null ? 1.0 : 0.0,
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
                        fullName: state.user?.name,
                      ),
                      ButtonOutline(
                        text: context.l10n.buttonDownloadCv,
                        onTap: () => openCVAction(state.user!.cv),
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
                      aboutMe: state.user?.intro ?? "",
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
