import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/common/extension/style/own_theme_fields.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../pages/home/host/host_routes.dart';
import '../behaviour/responsive_widget.dart';
import '../switcher/switcher_language.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function onHome;
  final Function onContact;
  final Function onPortfolio;
  final HomeRoutes defaultPage;

  const CommonAppBar(
      {Key? key,
      required this.onHome,
      this.defaultPage = HomeRoutes.intro,
      required this.onContact,
      required this.onPortfolio})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return GeneralMenuBar(
      defaultPage: widget.defaultPage,
      onContact: widget.onContact,
      onPortfolio: widget.onPortfolio,
      onHome: widget.onHome,
    );
  }
}

class GeneralMenuBar extends StatefulWidget {
  final Function onHome;
  final Function onContact;
  final Function onPortfolio;
  final HomeRoutes defaultPage;

  const GeneralMenuBar(
      {Key? key,
      required this.onHome,
      required this.onContact,
      required this.onPortfolio,
      required this.defaultPage})
      : super(key: key);

  @override
  State<GeneralMenuBar> createState() => _GeneralMenuBarState();
}

class _GeneralMenuBarState extends State<GeneralMenuBar> {
  late HomeRoutes rout;

  @override
  void initState() {
    rout = widget.defaultPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: ResponsiveWidget(
                    mobileScreen: _buildIconMenu(context),
                    desktopScreen: _buildTextMenu(context),
                  )),
            ),
            SwitcherLanguage(
              margin: EdgeInsets.only(
                  right: ResponsiveWrapper.of(context).isDesktop ? 16 : 8),
              onTapOnName: widget.onHome,
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

  Widget _buildIconMenu(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            if (rout != HomeRoutes.intro) {
              rout = HomeRoutes.intro;
              setState(() {});
              widget.onHome();
            }
          },
          child: Icon(
            Icons.home,
            color: rout == HomeRoutes.intro
                ? Theme.of(context).colorPlate().orange
                : Theme.of(context).colorPlate().yellow,
          ),
        ),
        TextButton(
          onPressed: () {
            if (rout != HomeRoutes.projects) {
              rout = HomeRoutes.projects;
              setState(() {});
              widget.onPortfolio.call();
            }
          },
          child: Icon(
            Icons.article_outlined,
            color: rout == HomeRoutes.projects
                ? Theme.of(context).colorPlate().orange
                : Theme.of(context).colorPlate().yellow,
          ),
        ),
        TextButton(
          onPressed: () {
            if (rout != HomeRoutes.contact) {
              rout = HomeRoutes.contact;
              setState(() {});
              widget.onContact();
            }
          },
          child: Icon(
            Icons.perm_contact_cal,
            color: rout == HomeRoutes.contact
                ? Theme.of(context).colorPlate().orange
                : Theme.of(context).colorPlate().yellow,
          ),
        ),
      ],
    );
  }

  Widget _buildTextMenu(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      primary: Theme.of(context).buttonTheme.colorScheme!.secondary,
      padding: const EdgeInsets.all(8),
      textStyle: Theme.of(context).textTheme.headline5!.copyWith(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).buttonTheme.colorScheme!.secondary),
    );

    final ButtonStyle activeFlatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      primary: Theme.of(context).buttonTheme.colorScheme!.primary,
      padding: const EdgeInsets.all(8),
      textStyle: Theme.of(context).textTheme.headline5!.copyWith(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).buttonTheme.colorScheme!.secondary),
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              rout = HomeRoutes.intro;
              widget.onHome();
              setState(() {});
            },
            child: const Text(
              "HOME",
              textAlign: TextAlign.center,
            ),
            style: rout == HomeRoutes.intro
                ? flatButtonStyle
                : activeFlatButtonStyle,
          ),
          TextButton(
            onPressed: () {
              rout = HomeRoutes.projects;
              widget.onPortfolio.call();
              setState(() {});
            },
            child: const Text(
              "PORTFOLIO",
              textAlign: TextAlign.center,
            ),
            style: rout == HomeRoutes.projects
                ? flatButtonStyle
                : activeFlatButtonStyle,
          ),
          TextButton(
            onPressed: () {
              rout = HomeRoutes.contact;
              setState(() {});
              widget.onContact();
            },
            child: const Text(
              "CONTACT",
              textAlign: TextAlign.center,
            ),
            style: rout == HomeRoutes.contact
                ? flatButtonStyle
                : activeFlatButtonStyle,
          ),
        ],
      ),
    );
  }
}
