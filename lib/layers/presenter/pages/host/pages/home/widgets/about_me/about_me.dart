import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../../../../../domain/entity/model/user/portfolio_skills_model.dart';
import '../../../../../../common/widgets/expanded/tree/tree_view.dart';

class AboutMe extends StatefulWidget {
  final String aboutMe;

  // final List<Map<String, dynamic>> skills;
  final List<PortfolioSkillsModel> skills;

  const AboutMe({Key? key, required this.skills, required this.aboutMe})
      : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveWrapper.of(context).isDesktop ? 32 : 24,
                    vertical: 32),
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
                      widget.aboutMe,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w100),
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
                      data: widget.skills,
                      subCategoryTextStyle:
                          ResponsiveWrapper.of(context).isDesktop
                              ? Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(fontWeight: FontWeight.w100)
                              : Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontWeight: FontWeight.w100),
                      categoryTextStyle: ResponsiveWrapper.of(context).isDesktop
                          ? Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.w500)
                          : Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
