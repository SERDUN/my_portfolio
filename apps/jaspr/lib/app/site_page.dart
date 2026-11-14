import 'package:domain/domain.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../features/shell/site_footer.dart';
import '../features/shell/site_header.dart';
import 'site_content.dart';
import 'site_paths.dart';

/// One page of the site in one language: the document language and head, the
/// header, the page, the footer and the menu sheet. Flutter's `ShellPage` with
/// a `PageScaffold` inside.
///
/// [route] is the page as `AppRoutes` spells it, so the head can name the
/// same page in every language and the language switch can link to it.
Component sitePage(
  SiteContent content, {
  required ShellDestination current,
  required String route,
  required String title,
  required String description,
  required Component child,
}) {
  return Component.fragment([
    Document.html(attributes: {'lang': content.language.code}),
    Document.head(
      title: title,
      meta: {'description': description},
      children: [
        for (final language in Language.values)
          link(rel: 'alternate', href: SitePaths.of(language, route), attributes: {'hreflang': language.code}),
        link(
          rel: 'alternate',
          href: SitePaths.of(Language.fallback, route),
          attributes: const {'hreflang': 'x-default'},
        ),
      ],
    ),
    siteHeader(content, current: current, route: route),
    main_(classes: 'site-main', [child]),
    siteFooter(content),
    mobileMenu(content, current: current),
  ]);
}
