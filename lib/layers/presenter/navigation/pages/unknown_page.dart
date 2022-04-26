import 'package:flutter/material.dart';
import 'package:my_portfolio/layers/presenter/navigation/pages/base_page.dart';

import '../../pages/unknown/unknown_screen.dart';

class UnknownPage extends BasePage {
  const UnknownPage()
      : super(key: const ValueKey('UnknownPage'), args: const {});

  @override
  Widget root() => UnknownScreen();
}
