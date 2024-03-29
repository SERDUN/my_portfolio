import 'package:flutter/material.dart';

import 'package:octo_image/octo_image.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/core/widgets/widgets.dart';

class DesktopPortfolioItem extends StatelessWidget {
  const DesktopPortfolioItem({
    Key? key,
    required this.openDetails,
    required this.project,
    required this.chipColor,
    required this.tags,
    required this.chipName,
  }) : super(key: key);

  final Function openDetails;
  final ProjectModel project;
  final Color chipColor;
  final String chipName;
  final String tags;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .35,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 32),
              child: Card(
                elevation: 3,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  width: double.infinity,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: OctoImage(
                      image: Image.network(project.preview ?? "").image,
                      placeholderBuilder: OctoPlaceholder.blurHash('LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
                      errorBuilder: OctoError.icon(color: Colors.red),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        project.name ?? "",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SimpleChip(
                        text: chipName,
                        color: chipColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .01,
                  ),
                  Text(
                    project.description ?? "",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    tags,
                    maxLines: 3,
                  ),
                  const Spacer(),
                  const Dash(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    direction: DashedLineDirection.horizontal,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
