import 'package:flutter/material.dart';
import 'package:my_portfolio/application/navigation/pages/base_page.dart';

import '../../../unknown_screen.dart';

class SplashPage extends BasePage {
  const SplashPage()
      : super(key: const ValueKey('SplashPage'), args: const {});

  @override
  Widget root() => Center(child: CircularProgressIndicator(),);
}
