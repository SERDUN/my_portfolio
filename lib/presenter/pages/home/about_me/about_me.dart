import 'package:flutter/material.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:my_portfolio/presenter/ui/widgets/tree/tree_view.dart';

import '../../../../routes.dart';

class AboutMe extends StatefulWidget {
  AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  int currentHover = -1;
  final List<Map<String, dynamic>> treeData = [
    {
      "title": "Mobile",
      "expaned": false,
      "children": [
        {
          "title": "Android",
          "expaned": false,
          "children": [
            {
              "title": "Java core",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Kotlin",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Jetpack",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Koin",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Retrofit",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Many other auxiliary libraries ",
              "expaned": false,
              "children": [],
            },
          ],
        },
        {
          "title": "Flutter",
          "expaned": false,
          "children": [
            {
              "title": "Dart",
              "expaned": false,
              "children": [],
            },
            {
              "title": "BLoC",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Redux",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Localization",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Lottie",
              "expaned": false,
              "children": [],
            },  {
              "title": "Web",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Creating plugin",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Custom animation",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Navigation",
              "expaned": false,
              "children": [],
            },
          ],
        },
        {
          "title": "General practice",
          "expaned": false,
          "children": [
            {
              "title": "Clean architecture",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Dependency injection",
              "expaned": false,
              "children": [],
            },
            {
              "title": "OOP/SOLID",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Git",
              "expaned": false,
              "children": [],
            },
            {
              "title": "RESTful",
              "expaned": false,
              "children": [],
            },
            {
              "title": "Firebase",
              "expaned": false,
              "children": [],
            }, {
              "title": "Payments integration",
              "expaned": false,
              "children": [],
            },
          ],
        },
      ],
    },
    {
      "title": "Back-end",
      "expaned": false,
      "children": [
        {
          "title": "NodeJS (Beginner)",
          "expaned": false,
          "children": [],
        },
        {
          "title": "Firebase cloud functions",
          "expaned": false,
          "children": [],
        },
      ],
    },
    {
      "title": "Database",
      "expaned": false,
      "children": [
        {
          "title": "SQL",
          "expaned": false,
          "children": [],
        },
        {
          "title": "Firebase database",
          "expaned": false,
          "children": [],
        },
        {
          "title": "Shared preferences",
          "expaned": false,
          "children": [],
        },
      ],
    },
  ];

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
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Hi, let me introduce myself. Me twenty-five years and i Live in Ukraine, Odessa.I am a mobile developer with more than 4 years of experience. My main platform is Android but for the last 2 years  in general i've created or were practicipiting Flutter cross-platform projects. By the way  this webpage also developet by Flutter framework)"
                      "Glory to Ukraine",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "My skills",
                      style: Theme.of(context).textTheme.headline1,

                      // style: titleBlackBold,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TreeView(
                      data: treeData,
                      titleOnTap: () {
                        print('title');
                      },
                      leadingOnTap: () {
                        print('leading');
                      },
                      trailingOnTap: () {
                        print('trailing');
                      },
                      textStyle: Theme.of(context).textTheme.bodyText1!,
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
