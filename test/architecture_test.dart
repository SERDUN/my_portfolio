import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The container is read in exactly one widget, the composition root; the
/// rest of the presentation layer gets dependencies from the widget tree.
/// Only import and export directives are checked, so comments never trip it.
/// (Domain purity has its own test in package/domain.)
void main() {
  List<File> dartFiles(String dir) =>
      Directory(dir).listSync(recursive: true).whereType<File>().where((f) => f.path.endsWith('.dart')).toList();

  /// Forward-slash path relative to the package root, on every platform.
  String relative(File file) => file.uri.pathSegments.skipWhile((s) => s != 'lib').join('/');

  Iterable<String> directives(File file) =>
      file.readAsLinesSync().map((l) => l.trim()).where((l) => l.startsWith('import ') || l.startsWith('export '));

  test('only the composition root and the DI setup reach the container', () {
    const allowed = {
      'lib/bootstrap.dart',
      'lib/app/app_widget.dart',
      'lib/di/injection.dart',
      'lib/di/injection.config.dart',
    };
    final container = RegExp(r"""['"]package:(get_it/|my_portfolio/di/injection\.dart)""");
    final offenders = [
      for (final file in dartFiles('lib'))
        if (!allowed.contains(relative(file)))
          for (final directive in directives(file))
            if (container.hasMatch(directive)) '${relative(file)}: $directive',
    ];
    expect(offenders, isEmpty);
  });

  test('presentation code never imports data, DTOs or repository implementations', () {
    final data = RegExp(r"""['"]package:data/""");
    final offenders = [
      for (final dir in ['lib/app', 'lib/core', 'lib/features', 'lib/localization', 'lib/style'])
        for (final file in dartFiles(dir))
          for (final directive in directives(file))
            if (data.hasMatch(directive)) '${relative(file)}: $directive',
    ];
    expect(offenders, isEmpty);
  });
}
