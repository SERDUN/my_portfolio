import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../navigation/state/navigation_cubit.dart';
import '../switcher/switcher_language.dart';

class ProjectDetailsBar extends StatefulWidget implements PreferredSizeWidget {
  const ProjectDetailsBar({
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
        Row(
          children: <Widget>[
            Flexible(
                child: InkWell(
              onTap: () {
                // Navigator.of(context, rootNavigator: true).pop();
                BlocProvider.of<NavigationCubit>(context).popOrProjects();

              },
              child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back_ios,
                          color: Theme.of(context).colorPlate().orange),
                      Text(
                        "BACK",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorPlate().orange),
                      )
                    ],
                  )),
            )),
            SwitcherLanguage(
              margin: EdgeInsets.only(
                  right: ResponsiveWrapper.of(context).isDesktop ? 16 : 8),
              onTapOnName: () {
                  Navigator.of(context, rootNavigator: true).pop();
              },
            )
          ],
        ),
        Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 0),
            color: const Color(0xFFEEEEEE)),
      ],
    );
  }
}
