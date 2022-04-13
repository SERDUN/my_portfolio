import 'package:flutter/material.dart';
import 'package:my_portfolio/config/colors.dart';
import '../widgets/menu/main_menu.dart';

class GeneralMenuBar extends StatefulWidget {
  final Function onHome;
  final Function onContact;
  final Function onPortfolio;

  const GeneralMenuBar(
      {Key? key,
      required this.onHome,
      required this.onContact,
      required this.onPortfolio})
      : super(key: key);

  @override
  State<GeneralMenuBar> createState() => _GeneralMenuBarState();
}

class _GeneralMenuBarState extends State<GeneralMenuBar> {
  bool isUa = true;

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: MainMenu(
                    onHome: widget.onHome,
                    onContact: widget.onContact,
                    onPortfolio: widget.onPortfolio,
                  ),
                ),
                GestureDetector(
                  onTap: () => widget.onHome(),
                  child: Text(
                      MediaQuery.of(context).size.width < 350
                          ? "DS"
                          : "Dmitro Serdun",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: isUa
                          ? buildLanguage("assets/image/language/ua.png")
                          : buildLanguage("assets/image/language/en.png"),
                      onTap: () {
                        setState(() {
                          isUa = !isUa;
                        });
                      },
                    )),

              ],
            ),
          ),
          Container(
              height: 1,
              margin: const EdgeInsets.only(bottom: 0),
              color: const Color(0xFFEEEEEE)),
        ],

    );
  }

  Container buildLanguage(String path) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 24,
      height: 24,
      child: Image.asset(path),
    );
  }
}
