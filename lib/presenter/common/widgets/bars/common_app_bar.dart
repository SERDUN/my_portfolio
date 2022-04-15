import 'package:flutter/material.dart';
import 'package:my_portfolio/presenter/common/extension/style/own_theme_fields.dart';
import 'package:my_portfolio/presenter/common/widgets/switcher/switcher_language.dart';
import '../behaviour/responsive_widget.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function onHome;
  final Function onContact;
  final Function onPortfolio;

  const CommonAppBar(
      {Key? key,
      required this.onHome,
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

  const GeneralMenuBar(
      {Key? key,
      required this.onHome,
      required this.onContact,
      required this.onPortfolio})
      : super(key: key);

  @override
  State<GeneralMenuBar> createState() => _GeneralMenuBarState();
}

class _GeneralMenuBarState extends State<GeneralMenuBar> {
  int indexMenu = 0;

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
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: ResponsiveWidget(
                      mobileScreen: _buildIconMenu(context),
                      desktopScreen: _buildTextMenu(context),
                    )),
              ),
              SwitcherLanguage(
                onTapOnName: widget.onHome,
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

  Widget _buildIconMenu(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            indexMenu = 0;
            setState(() {});
            widget.onHome();
          },
          child: Icon(
            Icons.home,
            color: indexMenu == 0
                ? Theme.of(context).colorPlate().orange
                : Theme.of(context).colorPlate().yellow,
          ),
        ),
        TextButton(
          onPressed: () {
            indexMenu = 1;
            setState(() {});
            widget.onPortfolio.call();
          },
          child: Icon(
            Icons.article_outlined,
            color: indexMenu == 1
                ? Theme.of(context).colorPlate().orange
                : Theme.of(context).colorPlate().yellow,
          ),
        ),
        TextButton(
          onPressed: () {
            indexMenu = 2;
            setState(() {});
            widget.onContact();
          },
          child: Icon(
            Icons.perm_contact_cal,
            color: indexMenu == 2
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
      primary: Theme.of(context).buttonTheme.colorScheme!.primary,
      padding: const EdgeInsets.all(8),
      textStyle: Theme.of(context).textTheme.headline5!.copyWith(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).buttonTheme.colorScheme!.secondary),
    );

    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            indexMenu = 0;
            widget.onHome();
            setState(() {});
          },
          child: const Text(
            "HOME",
            textAlign: TextAlign.center,
          ),
          style: indexMenu == 0 ? flatButtonStyle : activeFlatButtonStyle,
        ),
        TextButton(
          onPressed: () {
            indexMenu = 1;
            widget.onPortfolio.call();
            setState(() {});
          },
          child: const Text(
            "PORTFOLIO",
            textAlign: TextAlign.center,
          ),
          style: indexMenu == 1 ? flatButtonStyle : activeFlatButtonStyle,
        ),
        TextButton(
          onPressed: () {
            indexMenu = 2;
            setState(() {});

            widget.onContact();
          },
          child: const Text(
            "CONTACT",
            textAlign: TextAlign.center,
          ),
          style: indexMenu == 2 ? flatButtonStyle : activeFlatButtonStyle,
        ),
      ],
    );
  }
}
