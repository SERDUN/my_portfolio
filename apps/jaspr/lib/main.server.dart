import 'dart:io';

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app/app.dart';
import 'app/site_content.dart';
import 'main.server.options.dart';
import 'services/file_asset_loader.dart';
import 'theme/token_styles.dart';

/// Entrypoint of the pre-render pass.
///
/// `jaspr: mode: static` renders every route through this file at build time
/// and writes plain HTML. The content of every language is read first, through
/// the shared cubits, from package/data's bundled JSON (which the deploy pulls
/// from the content API before building). The [Document] is built here because
/// its unnamed constructor exists only in `package:jaspr/server.dart`.
Future<void> main() async {
  Jaspr.initializeApp(options: defaultServerOptions);

  final content = await loadSiteContent(FileAssetLoader(_dataPackageRoot()));

  runApp(
    Document(
      title: 'Dmytro Serdun',
      lang: 'en',
      head: [
        // Before anything paints: the visitor's theme choice, so a dark page
        // never flashes light. web/theme.js owns the switch itself.
        script(content: _themeBootstrap),
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: const {'crossorigin': ''}),
        link(rel: 'stylesheet', href: _fonts),
        Component.element(tag: 'style', children: [RawText(tokenStylesheet())]),
        link(rel: 'stylesheet', href: '/styles.css'),
        script(src: '/theme.js', defer: true),
      ],
      body: App(content: content),
    ),
  );
}

/// The fonts the Flutter theme loads through google_fonts, in the weights the
/// type scale uses. Upright only: the Flutter theme pins each style to the
/// upright file, so its italic headline accent is the upright face slanted,
/// and the browser synthesises the same slant when no italic face exists.
const _fonts =
    'https://fonts.googleapis.com/css2'
    '?family=Fraunces:wght@400;500'
    '&family=Manrope:wght@400;500;600;700'
    '&family=JetBrains+Mono:wght@400'
    '&family=Playfair+Display:wght@400;500'
    '&display=swap';

const _themeBootstrap =
    "try{var t=localStorage.getItem('theme');if(t==='light'||t==='dark'){"
    'document.documentElement.dataset.theme=t;document.documentElement.dataset.themePreference=t}'
    '}catch(e){}';

/// package/data, found from the working directory: the build runs in
/// apps/jaspr, a test or a script may run from the repository root.
String _dataPackageRoot() {
  for (final candidate in ['../../package/data', 'package/data']) {
    if (Directory('$candidate/assets/data').existsSync()) return candidate;
  }
  throw StateError('package/data not found from ${Directory.current.path}');
}
