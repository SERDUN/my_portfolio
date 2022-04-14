import 'package:flutter/material.dart';
import 'package:my_portfolio/presenter/common/extension/style/own_theme_fields.dart';
import '../switcher/switcher_language.dart';

class ProjectDetailsBar extends StatefulWidget implements PreferredSizeWidget {
  ProjectDetailsBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

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
                        Icon(Icons.arrow_back_ios,
                            color: Theme.of(context).colorPlate().orange),
                        Text(
                          "BACK",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorPlate().orange),
                        )
                      ],
                    )),
              )),
              SwitcherLanguage(
                onTapOnName: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              )
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
}
