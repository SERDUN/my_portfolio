import 'package:flutter/material.dart';

import 'package:my_portfolio/app/app.dart';

class SwitcherLanguage extends StatelessWidget {
  const SwitcherLanguage({
    Key? key,
    this.margin = EdgeInsets.zero,
    required this.localizationChanged,
  }) : super(key: key);

  final EdgeInsets margin;
  final Function() localizationChanged;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: localizationChanged,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: buildLanguage(
                  locale == "en" ? Assets.image.language.uk.path : Assets.image.language.en.path,
                ),
              ),
              buildLanguage(
                locale == "en" ? Assets.image.language.en.path : Assets.image.language.uk.path,
              )
            ],
          ),
        ));
  }

  Widget buildLanguage(String path) {
    return Center(
      child: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset(path),
      ),
    );
  }
}
