import 'package:flutter/material.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:my_portfolio/presenter/pages/portfollio/portfolio_item.dart';

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
          margin: const EdgeInsets.only(top: 16),
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
