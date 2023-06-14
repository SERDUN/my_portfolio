import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/layers/presenter/features/project/widgets/desktop_project_details_page.dart';
import 'package:my_portfolio/layers/presenter/features/project/widgets/mobile_project_details_page.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:my_portfolio/core/core.dart';
import '../../../common/widgets/behaviour/responsive_widget.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';

class ProjectDetailsPage extends StatefulWidget {
  final String id;

  const ProjectDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ProjectDetailsPage> with TickerProviderStateMixin {
  late final ProjectDetailsBloc _bloc = BlocProvider.of<ProjectDetailsBloc>(context);

  @override
  void didChangeDependencies() {
    String? locale = EasyLocalization.of(context)?.locale.languageCode;
    pLogger.i("HomePage-> didChangeDependencies $locale");
    _bloc.add(GetProjectEvent(widget.id, locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectDetailsBloc, ProjectDetailsState>(builder: (context, state) {
      if (state.projects == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
          body: SingleChildScrollView(
            child: ResponsiveWidget(
              desktopScreen: DesktopProjectDetailsPage(
                project: state.projects!,
                openLink: _openLinkAction,
              ),
              mobileScreen: MobileProjectDetailsPage(
                project: state.projects!,
                openLink: _openLinkAction,
              ),
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
