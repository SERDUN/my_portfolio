import 'package:jaspr/client.dart';

import 'main.client.options.dart';

/// Entrypoint of the browser bundle.
///
/// The server already sent the whole document; [ClientApp] finds the `@client`
/// islands in that markup and hydrates each in place. There are none yet (the
/// language switch is the first), but the entrypoint is here so the dart2js
/// half of the build is proven along with the pre-render.
void main() {
  Jaspr.initializeApp(options: defaultClientOptions);
  runApp(const ClientApp());
}
