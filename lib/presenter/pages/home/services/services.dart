import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:my_portfolio/domain/entity/model/service_model.dart';

import '../../../../routes.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  var services = <ServiceModel>[];

  @override
  void initState() {
    services.add(ServiceModel(
        title: 'Android app',
        description:
            'Створення нативного мобільного додатку використовуючи Android sdk and kotlin'));
    services.add(ServiceModel(
        title: 'iOS app',
        description:
            'Створення нативного мобільного додатку використовуючи Android sdk and kotlinAndroid sdk and kotlin'));
    services.add(ServiceModel(
        title: 'NodeJs Server',
        description:
            'Створення нативного мобільного додатку використовуючи Android sdk and kotlin'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 32, bottom: 24),
            child: Text("Services",                      style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Wrap(
              direction: Axis.horizontal,
              children: (services.map((i) => buildCard(i)).toList()))

          // Container(
          //     height: 1,
          //     margin: const EdgeInsets.only(bottom: 30),
          //     color: const Color(0xFFEEEEEE)),
        ],
      ),
    );
  }

  Card buildCard(ServiceModel service) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Container(
            width: 208,
            height: 176,
            transform: Matrix4Transform()
                .scale(1.5)
                .translate(x: -200, y: 104)
                .matrix4,
            decoration:
                 BoxDecoration(shape: BoxShape.circle, color:Theme.of(context).buttonTheme.colorScheme!.secondary),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, bottom: 8),
            child: Image.asset(
              "assets/image/icons/android.png",
              width: 24,
              height: 24,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: 208,
            height: 176,
            child: Column(
              children: [
                Text(
                  service.title,
                  style: subtitleBoldTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  service.description,
                  textAlign: TextAlign.center,
                  // style: GoogleFonts.ubuntu(
                  //     textStyle: TextStyle(
                  //         fontSize: 14,
                  //         color: textSecondary,
                  //         letterSpacing: 0.5,
                  //         fontWeight: FontWeight.w300)),
                ),
              ],
            ),
          ),
        ]));
  }
}
