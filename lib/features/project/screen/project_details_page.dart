import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:my_portfolio/core/core.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';
import '../widgets/widgets.dart';

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
    _bloc.add(GetProjectEvent(widget.id, ""));
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
        return SingleChildScrollView(
          child: ResponsiveWidget(
            desktopScreen: DesktopProjectDetailsPage(
              project: state.projects!,
              onOpenLink: _openLinkAction,
            ),
            mobileScreen: MobileProjectDetailsPage(
              project: state.projects!,
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
