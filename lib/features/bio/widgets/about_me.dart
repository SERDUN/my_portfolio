import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_breakpoints.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';
import 'package:my_portfolio/localization/localization.dart';

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
      children: <Widget>[
        Container(
          color: Theme.of(context).colorScheme.background.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.portfolioAboutMe,
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
                context.l10n.introSkills,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 8,
              ),
              TreeView(
                data: skills,
                subCategoryTextStyle: ResponsiveBreakpoints.of(context).isDesktop
                    ? Theme.of(context).textTheme.bodyLarge!
                    : Theme.of(context).textTheme.bodyMedium!,
                categoryTextStyle: ResponsiveBreakpoints.of(context).isDesktop
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
