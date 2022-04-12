import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/presenter/pages/home/services/services.dart';
import 'package:my_portfolio/presenter/ui/menu/general_menu_bar.dart';


class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 240,
              child: Container(
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.1,
                          filterQuality: FilterQuality.low,
                          image: Svg("assets/image/patterns/bike.svg",
                              size: Size(92, 80)),
                          repeat: ImageRepeat.repeat)),
                  child: Stack(children: [

                  ])),
            ),

          ],
        ),
      ),
    );
  }
}
