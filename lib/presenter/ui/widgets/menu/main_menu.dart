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
        alignment: Alignment.centerRight,
        child: MediaQuery.of(context).size.width < 400
            ? _buildIconMenu()
            : _buildTextMenu());
  }

  Widget _buildIconMenu() {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(0),
    );
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () => onHome(),
          child: Icon(Icons.home),
          style: flatButtonStyle,
        ),
        TextButton(
          onPressed: () => onPortfolio.call(),
          child: Icon(Icons.article_outlined),
          style: flatButtonStyle,
        ),
        TextButton(
          onPressed: () => onContact(),
          child: Icon(Icons.perm_contact_cal),
          style: flatButtonStyle,
        ),
      ],
    );
  }

  Widget _buildTextMenu() {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(8),

    );
    return Wrap(
      alignment: WrapAlignment.center,

      children: <Widget>[
        TextButton(
          onPressed: () => onHome(),
          child: const Text(
            "HOME",
            textAlign: TextAlign.center,
          ),
          style: flatButtonStyle,
        ),
        TextButton(
          onPressed: () => onPortfolio.call(),
          child: const Text(
            "PORTFOLIO",
            textAlign: TextAlign.center,
          ),
          style: flatButtonStyle,
        ),
        TextButton(
          onPressed: () => onContact(),
          child: const Text(
            "CONTACT",
            textAlign: TextAlign.center,
          ),
          style: flatButtonStyle,
        ),
      ],
    );
  }
}
