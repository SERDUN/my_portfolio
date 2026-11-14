import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Root of the Jaspr presenter.
///
/// A skeleton for now: it proves the toolchain, the separate resolution and the
/// CI build before any screen is ported. The shell, the router over the shared
/// routes, the cubits and the design tokens come with the next stages.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return main_([
      h1([Component.text('Dmytro Serdun')]),
      p([Component.text('Portfolio, Jaspr presenter.')]),
    ]);
  }
}
