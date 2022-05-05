import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';
import 'package:my_portfolio/layers/presenter/pages/host/pages/portfolio/projects/widgets/desktop_portfolio_item.dart';
import 'package:my_portfolio/layers/presenter/pages/host/pages/portfolio/projects/widgets/mobile_portfolio_item.dart';

import '../../../../../../domain/entity/model/projects/project_model.dart';
import '../../../../../common/widgets/behaviour/responsive_widget.dart';
import '../../../../../navigation/state/navigation_cubit.dart';
class PortfolioItem extends StatelessWidget {
  final ProjectModel project;

  const PortfolioItem({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _openDetails(context),
        child: ResponsiveWidget(
          desktopScreen: DesktopPortfolioItem(
            chipColor:
                _getChipColorTechnology(project.tags.mainTechnology, context),
            chipName:
                _getChipStringTechnology(project.tags.mainTechnology, context),
            project: project,
            tags: _getThematicsTags(project.tags.projects),
            openDetails: () => _openDetails(context),
          ),
          mobileScreen: MobilePortfolioItem(
            project: project,
            openDetails: () => _openDetails(context),
          ),
        ));
  }

  void _openDetails(BuildContext context) =>
      BlocProvider.of<NavigationCubit>(context).openProjectDetails(project.id);

  Color _getChipColorTechnology(String technology, BuildContext context) {
    switch (technology) {
      case "flutter":
        return Colors.blue;
      case "android":
        return Colors.green;
    }
    return Theme.of(context).colorPlate.call().orange!;
  }

  //todo change on resources
  String _getChipStringTechnology(String technology, BuildContext context) {
    switch (technology) {
      case "flutter":
        return "Flutter";
      case "android":
        return "Android";
    }
    return "Project";
  }

  String _getThematicsTags(List<String> social) {
    String tags = "";
    for (var element in social) {
      tags = tags + "#$element ";
    }
    return tags;
  }
}
