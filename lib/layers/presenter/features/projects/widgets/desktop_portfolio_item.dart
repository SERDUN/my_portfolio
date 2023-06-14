import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';
import 'package:octo_image/octo_image.dart';

import '../../../../domain/entity/model/projects/project_model.dart';
import '../../../common/widgets/chip/simple_chip.dart';
import '../../../common/widgets/dash/dash_horizontal.dart';


class DesktopPortfolioItem extends StatelessWidget {
  final Function openDetails;
  final ProjectModel project;
  final Color chipColor;
  final String chipName;
  final String tags;

  const DesktopPortfolioItem(
      {Key? key,
      required this.openDetails,
      required this.project,
      required this.chipColor,
      required this.tags,
      required this.chipName})
      : super(key: key);

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
              child: _buildProjectLogo(context),
            )),
            Flexible(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
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
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            SimpleChip(
                              text: chipName,
                              color: chipColor,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Theme.of(context)
                                          .colorPlate()
                                          .white100),
                            )
                          ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .01,
                      ),
                      Text(
                        project.description ?? "",
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        tags,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w100,
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).colorPlate().yellow),
                      ),
                      const Spacer(),
                      DashHorizontal(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 8, right: 32, bottom: 4),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }

  Widget _buildProjectLogo(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
          margin: const EdgeInsets.all(4),
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: OctoImage(
                  image: Image.network(project.media?.preview.url ?? "").image,
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                  ),
                  errorBuilder: OctoError.icon(color: Colors.red),
                  fit: BoxFit.cover))),
    );
  }
}
