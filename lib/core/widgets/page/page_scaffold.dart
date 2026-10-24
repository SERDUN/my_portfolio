import 'package:material_ui/material_ui.dart';

/// Provides the footer that every [PageScaffold] below shows after its
/// content. The shell sets it once, so pages never depend on the shell
/// feature and the footer stays owned by the shell.
class PageFooterScope extends InheritedWidget {
  const PageFooterScope({super.key, required this.footer, required super.child});

  final Widget footer;

  static Widget? maybeOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<PageFooterScope>()?.footer;

  @override
  bool updateShouldNotify(PageFooterScope oldWidget) => footer != oldWidget.footer;
}

/// Scrolling page body with the scope's footer after the content. The content
/// is at least most of a viewport tall so the footer never floats mid-screen
/// while a page is still loading.
class PageScaffold extends StatelessWidget {
  const PageScaffold({super.key, required this.child, this.showFooter = true});

  final Widget child;
  final bool showFooter;

  @override
  Widget build(BuildContext context) {
    final footer = showFooter ? PageFooterScope.maybeOf(context) : null;
    assert(
      !showFooter || footer != null,
      'PageScaffold(showFooter: true) has no PageFooterScope above it: render it inside the shell, '
      'wrap it in a PageFooterScope, or pass showFooter: false.',
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight * 0.6),
                child: child,
              ),
              ?footer,
            ],
          ),
        );
      },
    );
  }
}
