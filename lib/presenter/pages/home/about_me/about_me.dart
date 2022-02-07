import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:my_portfolio/presenter/ui/widgets/tree/tree_view.dart';

import '../../../../routes.dart';

class AboutMe extends StatefulWidget {
  AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  List<String> _items = ["Java", "Kotlin", "Data"];
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
          ],
        },
        {
          "title": "Flutter",
          "expaned": false,
          "children": [],
        },
      ],
    },
    {
      "title": "Backend",
      "expaned": false,
      "children": [
        {
          "title": "NodeJS",
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
      "title": "Databases",
      "expaned": false,
      "children": [
        {
          "title": "SQL",
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
                      style: titleBlackBold,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Web design ",
                      style: buttonTextStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                      style: buttonTextStyle,
                    ),
                    // Wrap(
                    //   direction: Axis.horizontal,
                    //   children: _items.map((i) => skiils(i)).toList(),
                    // )
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "My skills",
                      style: titleBlackBold,
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
