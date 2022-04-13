import 'package:flutter/material.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:my_portfolio/presenter/pages/portfollio/projects/portfolio_item.dart';

import '../../../common/widgets/decoration/decoration_view.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Last projects'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const DecorationViewLines(),
              const SizedBox(
                height: 40,
              ),
              const PortfolioItem(),
              const PortfolioItem(),
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
