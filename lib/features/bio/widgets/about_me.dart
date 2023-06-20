import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key? key,
    required this.aboutMe,
    required this.skills,
  }) : super(key: key);

  final String aboutMe;
  final List<PortfolioSkillsModel> skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: Theme.of(context).colorScheme.background.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr("portfolio_about_me"),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 8,
              ),
              SelectableText(
                aboutMe,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Divider(
                height: 40,
              ),
              Text(
                tr("intro_skills"),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 8,
              ),
              TreeView(
                data: skills,
                subCategoryTextStyle: ResponsiveWrapper.of(context).isDesktop
                    ? Theme.of(context).textTheme.bodyLarge!
                    : Theme.of(context).textTheme.bodyMedium!,
                categoryTextStyle: ResponsiveWrapper.of(context).isDesktop
                    ? Theme.of(context).textTheme.bodyLarge!
                    : Theme.of(context).textTheme.bodyMedium!,
              )
            ],
          ),
        ),
      ],
    );
  }
}
