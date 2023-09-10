import 'package:flutter/material.dart';

import 'di/injection.dart';
import 'core/core.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy());
  await configureDependencies(AppEnvironmentKey.dev);
  runApp(const Application());
}
