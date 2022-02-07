import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/typography.dart';

import '../../../routes.dart';

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
    return Container(
      color: Colors.white.withOpacity(0.90),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => widget.onHome(),
                  child: Text("Dmitro Serdun",
                      style: GoogleFonts.montserrat(
                          color: textPrimary,
                          fontSize: 24,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w400)),
                ),

                // Align(
                //   alignment: Alignment.bottomLeft,
                //   child: Container(
                //       width: 128,
                //       height: 64,
                //       margin: EdgeInsets.only(bottom: 8, left: 24),
                //       child: Card(
                //         child: Container(
                //           margin: EdgeInsets.all(8),
                //           child: Column(
                //             children: [
                GestureDetector(
                  child: isUa
                      ? buildLanguage("assets/image/language/ua.png")
                      : buildLanguage("assets/image/language/en.png"),
                  onTap: () {
                    setState(() {
                      isUa = !isUa;
                    });
                  },
                ),
                //               buildLanguage("assets/image/language/en.png")
                //             ],
                //           ),
                //         ),
                //       )),
                // ),
                Flexible(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () => widget.onHome(),
                          child: Text(
                            "HOME",
                            style: buttonTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        FlatButton(
                          onPressed: () => widget.onPortfolio.call(),
                          child: Text(
                            "PORTFOLIO",
                            style: buttonTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        FlatButton(
                          onPressed: () => widget.onContact(),
                          child: Text(
                            "CONTACT",
                            style: buttonTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 1,
              margin: const EdgeInsets.only(bottom: 0),
              color: const Color(0xFFEEEEEE)),
        ],
      ),
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
