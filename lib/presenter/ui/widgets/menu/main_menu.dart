import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainMenu extends StatelessWidget {
  final Function onHome;
  final Function onPortfolio;
  final Function onContact;

  const MainMenu(
      {Key? key,
      required this.onHome,
      required this.onPortfolio,
      required this.onContact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: MediaQuery.of(context).size.width < 400
            ? _buildIconMenu(context)
            : _buildTextMenu(context));
  }

  Widget _buildIconMenu(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () => onHome(),
          child: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        TextButton(
          onPressed: () => onPortfolio.call(),
          child: Icon(Icons.article_outlined,
              color: Theme.of(context).colorScheme.background),
        ),
        TextButton(
          onPressed: () => onContact(),
          child: Icon(Icons.perm_contact_cal,
              color: Theme.of(context).colorScheme.background),
        ),
      ],
    );
  }

  Widget _buildTextMenu(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      primary: Theme.of(context).buttonTheme.colorScheme!.secondary,
      padding: const EdgeInsets.all(8),
      textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).buttonTheme.colorScheme!.secondary),

    );

    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () => onHome(),
          child: Text(
            "HOME",
            textAlign: TextAlign.center,),
          style: flatButtonStyle,
        ),
        TextButton(
          onPressed: () => onPortfolio.call(),
          child: Text(
            "PORTFOLIO",
            textAlign: TextAlign.center,
          ),
          style: flatButtonStyle,
        ),
        TextButton(
          onPressed: () => onContact(),
          child: Text(
            "CONTACT",
            textAlign: TextAlign.center,
          ),
          style: flatButtonStyle,
        ),
      ],
    );
  }
}
