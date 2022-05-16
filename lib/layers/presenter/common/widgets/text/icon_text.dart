import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../icon.dart';

enum IconTextType { selectable, clickable }

class IconText extends StatelessWidget {
  final String imagePath;
  final String title;
  final String content;
  final String url;
  final IconTextType type;
  final double? width;
  final bool isInverted;
  final Function(String url) call;

  const IconText(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.content,
      required this.call,
      required this.url,
      this.type = IconTextType.clickable,
      this.width,
      this.isInverted = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,

      child: buildBaseStruct(context),
    );
  }

  Widget buildBaseStruct(BuildContext context) {
    return Row(
      crossAxisAlignment:
          isInverted ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisAlignment:
          isInverted ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildIcon(imagePath, !isInverted),
        _buildWidget(imagePath, title, content, url,
            Theme.of(context).textTheme.bodyText1!, context),
        _buildIcon(imagePath, isInverted),
      ],
    );
  }

  Widget _buildIcon(String imagePath, bool isVisible) {
    return GestureDetector(
        onTap: () => call(url),
        child: Visibility(
          child: MouseRegion(
              cursor: type == IconTextType.clickable
                  ? SystemMouseCursors.click
                  : SystemMouseCursors.basic,
              child: Padding(
                child: AppIcon(imagePath, size: 56),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              )),
          visible: isVisible,
        ));
  }

  Widget _buildWidget(String imagePath, String title, String content,
      String url, TextStyle textStyle, BuildContext context) {
    switch (type) {
      case IconTextType.selectable:
        return _buildSelectableWidget(imagePath, title, content, url,
            Theme.of(context).textTheme.bodyText1!, context);
      case IconTextType.clickable:
        return _buildClickableWidget(imagePath, title, content, url,
            Theme.of(context).textTheme.bodyText1!, context);
    }
  }

  Widget _buildClickableWidget(String imagePath, String title, String content,
      String url, TextStyle textStyle, BuildContext context) {
    return Column(
      crossAxisAlignment:
          isInverted ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () => call(url),
            child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.w200),
                ))),
        const SizedBox(height: 5),
        SelectableText.rich(
          TextSpan(
            text: content,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontStyle: FontStyle.italic),
            mouseCursor: SystemMouseCursors.click,
            recognizer: TapGestureRecognizer()..onTap = () => call(url),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectableWidget(String imagePath, String title, String content,
      String url, TextStyle textStyle, BuildContext context) {
    return Column(
      crossAxisAlignment:
          isInverted ? CrossAxisAlignment.end : CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontWeight: FontWeight.w200),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () => call(url),
          child: SelectableText(
            content,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }
}
