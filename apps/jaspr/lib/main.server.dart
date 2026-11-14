import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app/app.dart';
import 'main.server.options.dart';

/// Entrypoint of the pre-render pass.
///
/// `jaspr: mode: static` renders every route through this file at build time
/// and writes plain HTML. The [Document] is built here because its unnamed
/// constructor exists only in `package:jaspr/server.dart`.
void main() {
  Jaspr.initializeApp(options: defaultServerOptions);
  runApp(
    Document(
      title: 'Dmytro Serdun',
      lang: 'en',
      head: [link(rel: 'stylesheet', href: '/styles.css')],
      body: const App(),
    ),
  );
}
