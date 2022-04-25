import 'package:flutter/material.dart';
import '../../../layers/presenter/pages/host_page/host_page.dart';
import 'base_page.dart';

class HomePage extends BasePage {
  const HomePage(Map<String, dynamic> args)
      : super(key: const ValueKey('HomePage'), name: "/", args: args);


  @override
  Widget root() =>const HostPage();
}
