import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../app/site_content.dart';
import '../../app/site_paths.dart';
import '../../components/layout.dart';

/// The dark footer band: "Let's talk", the email, the social links as pills,
/// and the bottom line with the flag and secondary links. Flutter's
/// `SiteFooter`.
Component siteFooter(SiteContent content) {
  const sourceUrl = 'https://github.com/SERDUN/my_portfolio';
  final strings = content.strings;
  final language = content.language;
  final contacts = content.contacts.contacts;
  final email = contacts.where((c) => c.isEmail).firstOrNull;
  final socials = contacts.where((c) => !c.isEmail).toList();

  Component external(String href, List<Component> children, {required String classes}) =>
      a(href: href, classes: classes, target: Target.blank, attributes: const {'rel': 'noopener'}, children);

  return footer(classes: 'site-footer', [
    contentWidth(classes: 'site-footer__inner', [
      div(classes: 'site-footer__contact', [
        div(classes: 'site-footer__heading', [
          eyebrow(strings.shell_navContacts, classes: 'site-footer__eyebrow'),
          h2(classes: 'site-footer__title t-headline-large t-tablet-display-medium', [
            .text(strings.shell_footerTitle),
          ]),
          if (email != null) a(href: email.link, classes: 'site-footer__email', [.text(email.displayValue)]),
        ]),
        div(classes: 'site-footer__socials', [
          for (final contact in socials)
            external(contact.link, [.text(contact.title)], classes: 'site-footer__social t-label-large'),
        ]),
      ]),
      div(classes: 'site-footer__bottom', [
        div(classes: 'site-footer__glory t-body-small', [
          span(classes: 'site-footer__flag', attributes: const {'aria-hidden': 'true'}, []),
          span([.text(strings.shell_footerGlory)]),
        ]),
        nav(classes: 'site-footer__links', [
          a(href: SitePaths.projects(language), classes: 'site-footer__link t-body-small', [
            .text(strings.shell_navProjects),
          ]),
          a(href: SitePaths.useful(language), classes: 'site-footer__link t-body-small', [.text(strings.useful_title)]),
          external(sourceUrl, [.text(strings.shell_footerSource)], classes: 'site-footer__link t-body-small'),
        ]),
      ]),
    ]),
  ]);
}
