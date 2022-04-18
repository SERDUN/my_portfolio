import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';
import 'package:my_portfolio/layers/presenter/common/widgets/chip/simple_chip.dart';
import 'package:my_portfolio/layers/presenter/pages/portfollio/projects/widgets/desktop_portfolio_item.dart';
import 'package:my_portfolio/layers/presenter/pages/portfollio/projects/widgets/mobile_portfolio_item.dart';
import 'package:octo_image/octo_image.dart';
import '../../../../../routes.dart';
import '../../../../domain/entity/model/projects/project_model.dart';
import '../../../common/widgets/behaviour/responsive_widget.dart';
import '../../../common/widgets/button/button_outline.dart';
import '../../../common/widgets/dash/dash_horizontal.dart';

class PortfolioItem extends StatelessWidget {
  final ProjectModel project;

  const PortfolioItem({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: DesktopPortfolioItem(
          project: project,
          openDetails: () => _openDetails(context),
        ),
      ),
      mobileScreen: MobilePortfolioItem(
        project: project,
        openDetails: () => _openDetails(context),
      ),
    );
  }

  void _openDetails(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .pushNamed(Routes.projectDetails, arguments: project.id);
  }
}
