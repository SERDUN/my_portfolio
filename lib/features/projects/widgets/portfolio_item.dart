import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';
import 'package:my_portfolio/app/app.dart';

import 'desktop_portfolio_item.dart';
import 'mobile_portfolio_item.dart';

class PortfolioItem extends StatelessWidget {
  const PortfolioItem({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openDetails(context),
      child: ResponsiveWidget(
        desktopScreen: DesktopPortfolioItem(
          chipColor: _getChipColorTechnology(context, project.technologies.first),
          chipName: project.technologies.first.toUpperCase(),
          project: project,
          tags: _getThematicsTags(project.technologies),
          openDetails: () => _openDetails(context),
        ),
        mobileScreen: MobilePortfolioItem(
          project: project,
          openDetails: () => _openDetails(context),
        ),
      ),
    );
  }

  void _openDetails(BuildContext context) {
    GoRouter.of(context).goNamed(AppRoutInfo.project.name, pathParameters: <String, String>{
      AppRoutInfo.projectId: project.id!,
    });
  }

  Color _getChipColorTechnology(BuildContext context, String technology) {
    switch (technology.toLowerCase()) {
      case "flutter":
        return Colors.blue;
      case "android":
        return Colors.green;
    }
    return Theme.of(context).colorScheme.primary;
  }

  String _getThematicsTags(List<String> social) {
    String tags = "";
    for (var element in social) {
      tags = "$tags#$element ";
    }
    return tags;
  }
}
