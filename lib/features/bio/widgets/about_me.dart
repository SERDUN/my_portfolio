import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

class AboutMe extends StatelessWidget {
  final String aboutMe;
  final List<PortfolioSkillsModel> skills;

  const AboutMe({Key? key, required this.aboutMe, required this.skills}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr("portfolio_about_me"),
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 8,
              ),
              SelectableText(
                aboutMe,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w100),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                tr("intro_skills"),
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 8,
              ),
              TreeView(
                data: skills,
                subCategoryTextStyle: ResponsiveWrapper.of(context).isDesktop
                    ? Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w100)
                    : Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w100),
                categoryTextStyle: ResponsiveWrapper.of(context).isDesktop
                    ? Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w500)
                    : Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ],
    );
  }
}
