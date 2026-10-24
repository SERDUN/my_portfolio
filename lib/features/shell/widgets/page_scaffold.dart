import 'package:material_ui/material_ui.dart';

import 'site_footer.dart';

/// Scrolling page body with the site footer after the content. The content is
/// at least one viewport tall so the footer never floats mid-screen while a
/// page is still loading.
class PageScaffold extends StatelessWidget {
  const PageScaffold({super.key, required this.child, this.showFooter = true});

  final Widget child;
  final bool showFooter;

  @override
  Widget build(BuildContext context) {
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
              if (showFooter) const SiteFooter(),
            ],
          ),
        );
      },
    );
  }
}
