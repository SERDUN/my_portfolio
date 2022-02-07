import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:my_portfolio/presenter/pages/home/services/services.dart';
import 'package:my_portfolio/presenter/ui/menu/general_menu_bar.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 48),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.04,
                    filterQuality: FilterQuality.low,
                    image: ExactAssetImage('assets/image/patterns/bike.png'),
                    repeat: ImageRepeat.repeat)),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
              ],
            )),

    );
  }

  Card buildCard() {
    return Card(
                margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  height: 176,
                  child: Column(
                    children: [
                      Text(
                        "Web design ",
                        style: buttonTextStyle,
                      ),
                      SizedBox(
                        height: 8,
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
