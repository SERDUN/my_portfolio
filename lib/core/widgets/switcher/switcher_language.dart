import 'package:easy_localization/easy_localization.dart';
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
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Stack(
            children: [
              Padding(
                child: buildLanguage(context.locale.languageCode == "en"
                    ? "assets/image/language/uk.webp"
                    : "assets/image/language/en.webp"),
                padding: const EdgeInsets.only(left: 8),
              ),
              buildLanguage(context.locale.languageCode == "en"
                  ? "assets/image/language/en.webp"
                  : "assets/image/language/uk.webp")
            ],
          ),
          onTap: localizationChanged,
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
