import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class SwitcherLanguage extends StatefulWidget {
  final Function onTapOnName;
  final EdgeInsets margin;

  const SwitcherLanguage(
      {Key? key, required this.onTapOnName, this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  State<SwitcherLanguage> createState() => _SwitcherLanguageState();
}

class _SwitcherLanguageState extends State<SwitcherLanguage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => widget.onTapOnName(),
            child: Text(
              MediaQuery.of(context).size.width < 350
                  ? "Serdun"
                  : "Dmitro Serdun",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontWeight: FontWeight.w100),
            ),
          ),
          MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Stack(
                  children: [
                    Padding(
                      child: buildLanguage(context.locale.languageCode == "en"
                          ? "assets/image/language/ua.webp"
                          : "assets/image/language/en.webp"),
                      padding: const EdgeInsets.only(left: 8),
                    ),
                    buildLanguage(context.locale.languageCode == "en"
                        ? "assets/image/language/en.webp"
                        : "assets/image/language/ua.webp")
                  ],
                ),
                onTap: () {
                  String newLocale =
                      context.locale.languageCode == "en" ? 'uk' : 'en';
                  context.setLocale(Locale(newLocale));
                  html.window.location.reload();
                },
              )),
        ],
      ),
    );
  }

  Container buildLanguage(String path) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 24,
      height: 24,
      child: Image.asset(path),
    );
  }
}
