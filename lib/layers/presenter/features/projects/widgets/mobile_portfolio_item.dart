import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import '../../../../domain/entity/model/projects/project_model.dart';
import '../../../common/widgets/dash/dash_horizontal.dart';


class MobilePortfolioItem extends StatelessWidget {
  final Function openDetails;
  final ProjectModel project;

  const MobilePortfolioItem(
      {Key? key, required this.openDetails, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            project.name ?? "",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            elevation: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 40),
                    child: Text(
                      project.description ?? "",
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  ),
                  DashHorizontal(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(vertical: 16),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(9.0),
                      child: OctoImage(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.75,
                          image: Image.network(project.media?.preview.url ?? "")
                              .image,
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                          ),
                          errorBuilder: OctoError.icon(color: Colors.red),
                          fit: BoxFit.fitWidth))
                ],
              ),
            ))
      ],
    );
  }
}
