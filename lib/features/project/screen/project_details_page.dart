import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

import '../bloc/project_cubit.dart';
import '../widgets/widgets.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ProjectDetailsPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(builder: (context, state) {
      if (state.project == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SingleChildScrollView(
          child: ResponsiveWidget(
            desktopScreen: DesktopProjectDetailsPage(
              project: state.project!,
              onOpenLink: _openLinkAction,
            ),
            mobileScreen: MobileProjectDetailsPage(
              project: state.project!,
              onOpen: _openLinkAction,
            ),
          ),
        );
      }
    });
  }

  void _openLinkAction(String? link) async {
    Uri? uri = Uri.tryParse(link ?? "");
    if (uri != null) {
      await canLaunchUrl(uri) ? await launchUrl(uri) : throw 'Could not launch $link';
    }
  }
}
