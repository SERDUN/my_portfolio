import 'package:flutter/material.dart';

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
  bool isSelectedUa = true;

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
              MediaQuery.of(context).size.width < 350 ? "DS" : "Dmitro Serdun",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontWeight: FontWeight.w100),
            ),
          ),
          MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: isSelectedUa
                    ? buildLanguage("assets/image/language/ua.webp")
                    : buildLanguage("assets/image/language/en.webp"),
                onTap: () {
                  setState(() {
                    isSelectedUa = !isSelectedUa;
                  });
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
