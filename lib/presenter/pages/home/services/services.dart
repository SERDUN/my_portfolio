import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/typography.dart';

import '../../../../routes.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Wrap(
          alignment:WrapAlignment.start,
          children: <Widget>[
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
          ],
        ),
        // Container(
        //     height: 1,
        //     margin: const EdgeInsets.only(bottom: 30),
        //     color: const Color(0xFFEEEEEE)),
      ],
    );
  }

  Card buildCard() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        width: 208,
        height: 164,
        child: Column(
          children: [
            Text(
              "Web design ",
              style: buttonTextStyle,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
              style: buttonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
