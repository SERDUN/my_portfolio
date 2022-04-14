import 'package:flutter/material.dart';

class SwitcherLanguage extends StatefulWidget {
  final Function onTapOnName;

  const SwitcherLanguage({Key? key, required this.onTapOnName})
      : super(key: key);

  @override
  State<SwitcherLanguage> createState() => _SwitcherLanguageState();
}

class _SwitcherLanguageState extends State<SwitcherLanguage> {
  bool isSelectedUa = true;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  ? buildLanguage("assets/image/language/ua.png")
                  : buildLanguage("assets/image/language/en.png"),
              onTap: () {
                setState(() {
                  isSelectedUa = !isSelectedUa;
                });
              },
            )),
      ],
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
