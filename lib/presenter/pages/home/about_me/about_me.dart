import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/typography.dart';

import '../../../../routes.dart';

class AboutMe extends StatefulWidget {
  AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  List<String> _items = ["Java", "Kotlin", "Data"];
  int currentHover = -1;

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
                      style: buttonTextStyle16.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
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

                    ListView.builder(
                      shrinkWrap: true,
                        itemCount: _items.length,
                        itemBuilder: (c, i) {
                          return Text(_items[i]);
                        })
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget skiils(int i) {
    return MouseRegion(
        onEnter: (PointerEnterEvent event) {
          currentHover = i;
          setState(() {});
        },
        onExit: (PointerExitEvent event) {
          currentHover = -1;
          setState(() {});
        },
        child: Container(
            margin: EdgeInsets.only(left: 30, top: 8, bottom: 8, right: 30),
            padding: EdgeInsets.all(8),
            height: 80,
            width: 80,
            child: Image.asset("assets/image/icons/java.png"),
            decoration: BoxDecoration(
              color: currentHover != i ? Colors.white : Color(0xffFF4289),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffFF4289)
                      .withOpacity(currentHover == i ? 0.4 : 0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            )));
  }
}
