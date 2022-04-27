import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/layers/presenter/pages/home/host/host_routes.dart';
import 'package:my_portfolio/layers/presenter/pages/portfolio/details/bloc/state.dart';
import 'package:my_portfolio/layers/presenter/pages/portfolio/details/widgets/desktop_project_details_page.dart';
import 'package:my_portfolio/layers/presenter/pages/portfolio/details/widgets/mobile_project_details_page.dart';
import '../../../common/widgets/bars/common_app_bar.dart';
import '../../../common/widgets/behaviour/responsive_widget.dart';
import '../../../navigation/state/navigation_cubit.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';

class ProjectDetailsPage extends StatefulWidget {
  final int id;

  const ProjectDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ProjectDetailsPage> {
  @override
  void initState() {
    BlocProvider.of<ProjectDetailsBloc>(context)
        .add(GetProjectEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectDetailsBloc, ProjectDetailsState>(
        builder: (context, state) {
      if (state.projects == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
          appBar: CommonAppBar(
            defaultPage: HomeRoutes.projects,
            onHome: () {
              BlocProvider.of<NavigationCubit>(context).replaceToIntro();
            },
            onPortfolio: () {
              BlocProvider.of<NavigationCubit>(context).popOrProjects();
            },
            onContact: () {
              BlocProvider.of<NavigationCubit>(context).replaceToContact();
            },
          ),
          body: SingleChildScrollView(
            child: ResponsiveWidget(
              desktopScreen:
                  DesktopProjectDetailsPage(project: state.projects!),
              mobileScreen: MobileProjectDetailsPage(project: state.projects!),
            ),
          ),
        );
      }
    });
  }
}
