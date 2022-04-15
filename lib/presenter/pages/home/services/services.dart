import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/typography.dart';
import 'package:my_portfolio/domain/entity/model/service_model.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

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
        iconData: Icons.android_outlined,
        description:
            'Create a native mobile application using Android sdk and kotlin and publication in store'));
    services.add(ServiceModel(
        title: 'iOS app',
        iconData: Icons.apple,
        description:
            'Creating an ios application using Flutter framework and publication in store'));
    services.add(ServiceModel(
        title: 'Simple backend',
        iconData: Icons.settings,
        description:
            'Creating a server part based on Firebase, using cloud functions'));
    services.add(ServiceModel(
        title: 'Web page',
        iconData: Icons.web,
        description:
            'Creating a web application using Flutter framework and publishing in release'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ResponsiveWrapper.of(context).isDesktop ? 32 : 24,
          vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 32, bottom: 8,left: 8),
            child: Text(
              "Services",
              style: Theme.of(context).textTheme.headline4,
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
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).buttonTheme.colorScheme!.secondary),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, bottom: 8),
            child: Icon(
              service.iconData,
              size: 24,
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
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  service.description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
        ]));
  }
}
