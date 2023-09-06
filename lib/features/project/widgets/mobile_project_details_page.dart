import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:octo_image/octo_image.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

import 'project_links.dart';

class MobileProjectDetailsPage extends StatelessWidget {
  const MobileProjectDetailsPage({
    Key? key,
    required this.project,
    required this.onOpen,
  }) : super(key: key);

  final ProjectModel project;
  final Function(String) onOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            (project.name ?? "").toUpperCase(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        const Align(alignment: Alignment.center, child: DecorationViewLines()),
        const SizedBox(
          height: 8,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              (project.intro ?? ""),
              textAlign: TextAlign.center,
            )),
        const SizedBox(
          height: 40,
        ),
        ProjectLinks(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          iconSize: 40,
          mainAxisAlignment: MainAxisAlignment.end,
          android: project.linkAndroid,
          ios: project.linkIOS,
          github: project.linkSource,
          onOpenLink: onOpen,
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            context.l10n.portfolio_description,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        const DashHorizontal(
          margin: EdgeInsets.only(top: 8),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              project.description ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        const SizedBox(
          height: 40,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Software stack",
              style: Theme.of(context).textTheme.displaySmall,
            )),
        const DashHorizontal(
          margin: EdgeInsets.only(top: 8),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (project.spheres).map((e) => _buildTags(context, e)).toList()),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: const SizedBox(
              height: 40,
            )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Screenshots",
              style: Theme.of(context).textTheme.displaySmall,
            )),
        const DashHorizontal(
          margin: EdgeInsets.only(top: 16, bottom: 16),
        ),
        SizedBox(
            child: CarouselSlider.builder(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.width / 2,
            aspectRatio: 9 / 16,
            viewportFraction: 0.25,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: project.screenshots.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 4,
                child: Padding(
                  child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: OctoImage(
                        image: Image.network(project.screenshots[itemIndex]).image,
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                        ),
                        errorBuilder: OctoError.icon(color: Colors.red),
                        fit: BoxFit.scaleDown,
                      )),
                  padding: const EdgeInsets.all(8),
                ),
              ),
            );
          },
        )),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }

  Row _buildTags(BuildContext context, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: const Text(" - "),
          padding: const EdgeInsets.all(8),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
