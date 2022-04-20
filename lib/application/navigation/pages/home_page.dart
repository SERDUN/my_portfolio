import 'package:flutter/material.dart';
import '../../../layers/presenter/pages/host_page/host_page.dart';

class HomePage extends Page {
  const HomePage() : super(key: const ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return const HostPage();
      },
    );
  }
}
