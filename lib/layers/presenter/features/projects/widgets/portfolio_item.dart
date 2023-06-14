import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/layers/presenter/app/app.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';
import 'package:my_portfolio/layers/presenter/features/projects/widgets/desktop_portfolio_item.dart';
import 'package:my_portfolio/layers/presenter/features/projects/widgets/mobile_portfolio_item.dart';

import '../../../../domain/entity/model/projects/project_model.dart';
import '../../../common/widgets/behaviour/responsive_widget.dart';

class PortfolioItem extends StatelessWidget {
  final ProjectModel project;

  const PortfolioItem({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _openDetails(context),
        child: ResponsiveWidget(
          desktopScreen: DesktopPortfolioItem(
            chipColor: _getChipColorTechnology(project.tags.mainTechnology, context),
            chipName: _getChipStringTechnology(project.tags.mainTechnology, context),
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

  void _openDetails(BuildContext context) {
    GoRouter.of(context).goNamed(AppRoutInfo.project.name, params: <String, String>{
      AppRoutInfo.projectId: project.id!,
    });
  }

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
