import 'package:flutter/material.dart';
import 'package:my_portfolio/application/navigation/pages/base_page.dart';

import '../../../unknown_screen.dart';

class UnknownPage extends BasePage {
  const UnknownPage()
      : super(key: const ValueKey('UnknownPage'), args: const {});

  @override
  Widget root() => UnknownScreen();

// @override
// Route createRoute(BuildContext context) {
//   return MaterialPageRoute(
//       settings: this,
//       builder: (BuildContext context) {
//         return UnknownScreen();
//       });
// }
}
