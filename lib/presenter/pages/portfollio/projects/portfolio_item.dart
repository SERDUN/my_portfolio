import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import '../../../common/widgets/behaviour/responsive_widget.dart';
import '../../../common/widgets/button/button_fill.dart';
import '../../../common/widgets/dash/dash_horizontall.dart';
import '../../host_page/navigation/host_navigator.dart';

class PortfolioItem extends StatelessWidget {
  const PortfolioItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      height: MediaQuery.of(context).size.width * .3,
                      width: MediaQuery.of(context).size.width * .3,
                      child: _buildPreview(context),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .3,
                      margin: const EdgeInsets.only(left: 32),
                      child: buildTechnology(context),
                    )
                  ],
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .01,
                    ),
                    _buildTitleProject(context),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .01,
                    ),
                    Container(
                      child: _buildProjectDescription(context),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .025,
                    ),
                    _buildSpecifyItems(context),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .025,
                    ),
                    // ButtonFill(text:"Open", onTap: (){},)
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            DashHorizontal(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 32),
            )
          ],
        ),
      ),
      mobileScreen: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * .30,
              child: _buildPreview(context),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 8, top: 8),
                child: buildTechnology(context),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * .075),
            SizedBox(
              height: MediaQuery.of(context).size.width * .01,
            ),
            _buildTitleProject(context),
            SizedBox(
              height: MediaQuery.of(context).size.width * .01,
            ),
            _buildProjectDescription(context),
            SizedBox(
              height: MediaQuery.of(context).size.width * .025,
            ),
            _buildSpecifyItems(context),
            SizedBox(
              height: MediaQuery.of(context).size.width * .025,
            ),
            DashHorizontal(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.zero,
            )

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
        // decoration: BoxDecoration(
        //   border: Border(
        //     bottom: BorderSide(
        //       //                    <--- top side
        //       color: Colors.grey.withOpacity(0.5),
        //       width: 0.5,
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Widget _buildSpecifyItems(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      elevation: 0,
      primary: Theme.of(context).buttonTheme.colorScheme?.secondary,
      padding: const EdgeInsets.only(right: 24),
      textStyle: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(fontWeight: FontWeight.bold),
    );
    return TextButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true)?.pushNamed(
          "rrr",
        );
      },
      child: const Text(
        "Open details",
        textAlign: TextAlign.center,
      ),
      style: flatButtonStyle,
    );
  }

  Widget _buildProjectDescription(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: SelectableText(
        "Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget _buildTitleProject(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: SelectableText(
          "MY PROJECTS",
          style: Theme.of(context).textTheme.headline1,
        ));
  }

  Widget _buildPreview(BuildContext context) {
    return Card(
      elevation: 2,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
            margin: const EdgeInsets.all(4),
            width: double.infinity,
            height: double.infinity,
            child: OctoImage(
              image: Image.network('https://blurha.sh/assets/images/img1.jpg')
                  .image,
              placeholderBuilder: OctoPlaceholder.blurHash(
                'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
              ),
              errorBuilder: OctoError.icon(color: Colors.red),
              fit: BoxFit.fitHeight,
            )),
      ),
    );
  }

  Wrap buildTechnology(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: ["Android", "Flutter", "444", "444", "444", "444", "weqwe444"]
          .map((s) => Container(
                child: Text(
                  s,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(24),
                ),
              ))
          .toList(),
    );
  }
}
