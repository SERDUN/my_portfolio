import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:get_it/get_it.dart';

import 'core/app_environment_keys.dart';
import 'di/injection.dart';

Future<void> bootstrap(FutureOr<Widget> Function(GetIt di) builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      usePathUrlStrategy();

      final di = await configureDependencies(AppEnvironmentKey.dev);

      return runApp(await builder(di));
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    },
  );
}
