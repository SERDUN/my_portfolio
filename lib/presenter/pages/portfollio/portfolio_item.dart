import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../config/colors.dart';
import '../../../config/typography.dart';
import '../../common/widgets/behaviour/responsive_widget.dart';

class PortfolioItem extends StatelessWidget {
  const PortfolioItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child:ResponsiveWidget(
      desktopScreen: SizedBox(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  height: MediaQuery.of(context).size.width * .3,
                  width: MediaQuery.of(context).size.width * .3,
                  child: _buildPreview(),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .01,
                    ),
                    _buildTitleProject(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .01,
                    ),
                    Container(
                      child: _buildProjectDescription(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .025,
                    ),
                    _buildSpecifyItems(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .025,
                    ),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
      mobileScreen: Container(
        margin: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * .30,
              child: _buildPreview(),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * .075),
            SizedBox(
              height: MediaQuery.of(context).size.width * .01,
            ),
            _buildTitleProject(),
            SizedBox(
              height: MediaQuery.of(context).size.width * .01,
            ),
            _buildProjectDescription(),
            SizedBox(
              height: MediaQuery.of(context).size.width * .025,
            ),
            _buildSpecifyItems(),
            SizedBox(
              height: MediaQuery.of(context).size.width * .025,
            ),

            // OutlineButton(
            //   onPressed: () {
            //     //    launch(project.url!);
            //   },
            //   borderSide: BorderSide(
            //     width: 5,
            //   ),
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 50,
            //     vertical: 20,
            //   ),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Text('Visit'),
            // ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide( //                    <--- top side
              color: Colors.grey.withOpacity(0.5),
              width: 0.5,
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildSpecifyItems() {
    return Wrap(
      spacing: 10,
      children: ["3", "4343", "444"].map((s) => Chip(label: Text(s))).toList(),
    );
  }

  Widget _buildProjectDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      ),
    );
  }

  Widget _buildTitleProject() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Text("MY PROJECTS"));
  }

  Widget _buildPreview() {
    return Card(
      elevation: 2,
      child: Container(
        child: OctoImage(
          image:
              Image.network('https://blurha.sh/assets/images/img1.jpg').image,
          placeholderBuilder: OctoPlaceholder.blurHash(
            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
          ),
          errorBuilder: OctoError.icon(color: Colors.red),
          fit: BoxFit.fitHeight,
        ),
        margin: EdgeInsets.all(4),
      ),
    );
  }
}
