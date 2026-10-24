import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Layering inside the app package, checked on the resolved target of every
/// import and export, relative ones included:
/// - a feature never imports another feature;
/// - a feature never imports the app barrel or the router (they import every
///   feature, so that is a cycle);
/// - core never imports a feature, and from app only typed navigation and
///   the semantics ids (both dependency-free leaves).
void main() {
  final libDir = Directory('lib').absolute.uri;

  List<File> dartFiles(String dir) =>
      Directory(dir).listSync(recursive: true).whereType<File>().where((f) => f.path.endsWith('.dart')).toList();

  /// lib-relative target paths ("features/home/home.dart") of a file's
  /// app-internal imports and exports.
  Iterable<String> targets(File file) sync* {
    final directive = RegExp(r"""^\s*(?:import|export)\s+['"]([^'"]+)['"]""");
    for (final line in file.readAsLinesSync()) {
      final uri = directive.firstMatch(line)?.group(1);
      if (uri == null || uri.startsWith('dart:')) continue;
      if (uri.startsWith('package:my_portfolio/')) {
        yield uri.substring('package:my_portfolio/'.length);
      } else if (!uri.startsWith('package:')) {
        final resolved = file.absolute.uri.resolve(uri).toString();
        if (resolved.startsWith(libDir.toString())) yield resolved.substring(libDir.toString().length);
      }
    }
  }

  String featureOf(String libPath) => libPath.split('/')[1];

  test('no feature imports another feature, the app barrel or the router', () {
    final offenders = <String>[];
    // features.dart is the barrel the router uses: exporting every feature is its job.
    for (final file in dartFiles('lib/features').where((f) => !f.path.endsWith('lib/features/features.dart'))) {
      final own = featureOf(file.absolute.uri.toString().substring(libDir.toString().length));
      for (final target in targets(file)) {
        final crossesFeature = target.startsWith('features/') && featureOf(target) != own;
        final cycle = target == 'app/app.dart' || target == 'app/app_router.dart' || target == 'app/app_widget.dart';
        if (crossesFeature || cycle) offenders.add('${file.path} -> $target');
      }
    }
    expect(offenders, isEmpty);
  });

  test('core imports no feature and from app only navigation and keys', () {
    final offenders = [
      for (final file in dartFiles('lib/core'))
        for (final target in targets(file))
          if (target.startsWith('features/') ||
              (target.startsWith('app/') && !const {'app/navigation.dart', 'app/keys.dart'}.contains(target)))
            '${file.path} -> $target',
    ];
    expect(offenders, isEmpty);
  });

  test('typed navigation and keys import nothing that imports features', () {
    final offenders = [
      for (final target in targets(File('lib/app/navigation.dart')))
        if (target != 'app/app_routes.dart') 'navigation -> $target',
      for (final target in targets(File('lib/app/keys.dart'))) 'keys -> $target',
    ];
    expect(offenders, isEmpty);
  });
}
