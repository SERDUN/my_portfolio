import 'dart:async';

import 'package:my_portfolio/style/style.dart';

/// Runs before every test file: fonts never come from the network in tests.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  GoogleFonts.config.allowRuntimeFetching = false;
  await testMain();
}
