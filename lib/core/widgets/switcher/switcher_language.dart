import 'package:flutter/material.dart';

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
                  locale == "en" ? "assets/image/language/uk.webp" : "assets/image/language/en.webp",
                ),
              ),
              buildLanguage(
                locale == "en" ? "assets/image/language/en.webp" : "assets/image/language/uk.webp",
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
