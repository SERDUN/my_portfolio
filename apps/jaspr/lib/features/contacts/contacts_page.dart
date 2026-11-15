import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:presentation/presentation.dart';

import '../../app/site_content.dart';
import '../../components/icons.dart';
import '../../components/layout.dart';
import '../../components/page_intro.dart';

/// Contacts: the statement, a short description and one card per channel.
/// Flutter's `ContactsPage` with its `ContactCard`s.
Component contactsPage(SiteContent content) {
  final strings = content.strings;
  return contentWidth(tag: 'section', classes: 'top-page', [
    pageIntro(
      eyebrowText: strings.shell_navContacts,
      title: strings.contacts_title,
      description: strings.contacts_description,
    ),
    div(classes: 'top-page__body', [
      responsiveGrid([
        for (final contact in content.contacts.contacts)
          a(
            href: contact.link,
            classes: 'contact-card',
            target: contact.isEmail ? null : Target.blank,
            attributes: {
              if (!contact.isEmail) 'rel': 'noopener',
              'aria-label': strings.contacts_semanticsLabel_openChannel(contact.title, contact.displayValue),
            },
            [
              div(classes: 'contact-card__text', [
                span(classes: 'contact-card__label t-label-small', [.text(contact.title.toUpperCase())]),
                span(classes: 'contact-card__address t-title-medium', [.text(contact.shownAddress)]),
              ]),
              appIcon(AppIcon.arrowOutward, size: 20, classes: 'contact-card__arrow'),
            ],
          ),
      ]),
    ]),
  ]);
}
