import 'package:flutter/material.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:my_portfolio/presenter/ui/widgets/tree/tree_view.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../../routes.dart';

class AboutMe extends StatefulWidget {
  final List<Map<String, dynamic>> skills;

  AboutMe({Key? key, required this.skills}) : super(key: key);

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
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About me",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SelectableText(
                      "Hi, let me introduce myself. \nMe twenty-five years and i Live in Ukraine, Odessa. I'm a mobile developer with more than 4 years of experience.\nMy main platform is Android but for the last 2 years  in general i've created or were practiced Flutter cross-platform projects. \nBy the way  this webpage also developet by Flutter framework)"
                      "\n\nGlory to Ukraine",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w100),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "My skills",
                      style: Theme.of(context).textTheme.headline4,

                      // style: titleBlackBold,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TreeView(
                      data: widget.skills,
                      titleOnTap: () {},
                      leadingOnTap: () {},
                      trailingOnTap: () {},
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
