import 'package:flutter/material.dart';

import 'base_page.dart';

class SplashPage extends BasePage {
  const SplashPage()
      : super(key: const ValueKey('SplashPage'), args: const {});

  @override
  Widget root() => Center(child: CircularProgressIndicator(),);
}
