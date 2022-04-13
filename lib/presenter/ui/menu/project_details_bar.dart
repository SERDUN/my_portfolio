import 'package:flutter/material.dart';
import 'package:my_portfolio/config/colors.dart';
import '../widgets/menu/main_menu.dart';

class ProjectDetailsBar extends StatefulWidget implements PreferredSizeWidget {
  ProjectDetailsBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<ProjectDetailsBar> {
  @override
  Widget build(BuildContext context) {
    return const ProjectDetailsBarWidget();
  }
}

class ProjectDetailsBarWidget extends StatefulWidget {
  const ProjectDetailsBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProjectDetailsBarWidget> createState() => _GeneralMenuBarState();
}

class _GeneralMenuBarState extends State<ProjectDetailsBarWidget> {
  bool isUa = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
          child: Row(
            children: <Widget>[
              Flexible(
                  child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .secondary,
                        ),
                        Text(
                          "BACK",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme!
                                      .secondary),
                        )
                      ],
                    )),
              )),
              GestureDetector(
                onTap: () => () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text(
                  MediaQuery.of(context).size.width < 350
                      ? "DS"
                      : "Dmitro Serdun",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: isUa
                        ? buildLanguage("assets/image/language/ua.png")
                        : buildLanguage("assets/image/language/en.png"),
                    onTap: () {
                      setState(() {
                        isUa = !isUa;
                      });
                    },
                  )),
            ],
          ),
        ),
        Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 0),
            color: const Color(0xFFEEEEEE)),
      ],
    );
  }

  Container buildLanguage(String path) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 24,
      height: 24,
      child: Image.asset(path),
    );
  }
}
