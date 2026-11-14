import 'package:domain/domain.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../app/site_content.dart';
import '../../components/icons.dart';
import '../../components/layout.dart';
import '../../components/page_intro.dart';

/// The owner's cheat sheet: one card per group, every command with a copy
/// button. Flutter's `UsefulCommandsPage` with its `CommandTile`s.
///
/// The copy button is web/copy.js: it writes `data-copy` to the clipboard,
/// shows the "copied" state for two seconds and announces it through the
/// page's live region. The labels for both states are in the markup.
Component usefulPage(SiteContent content) {
  final strings = content.strings;
  return contentWidth(tag: 'section', classes: 'top-page', [
    Document.head(children: [script(src: '/copy.js', defer: true)]),
    pageIntro(
      eyebrowText: strings.shell_navUseful,
      title: strings.useful_title,
      description: strings.useful_description,
    ),
    div(classes: 'top-page__body useful-groups', [for (final group in content.useful.groups) _group(content, group)]),
    div(classes: 'visually-hidden', attributes: const {'aria-live': 'polite', 'data-copy-status': ''}, []),
  ]);
}

Component _group(SiteContent content, CommandGroupModel group) {
  final strings = content.strings;
  return div(classes: 'command-group', [
    div(classes: 'command-group__title', [
      h2(classes: 't-headline-small', [.text(group.title)]),
      span(classes: 't-label-small', [.text('${group.commands.length}')]),
    ]),
    div(classes: 'command-group__list', [
      for (final (index, command) in group.commands.indexed) ...[
        if (index > 0) hr(classes: 'command-group__divider'),
        div(classes: 'command', [
          h3(classes: 't-title-small', [.text(command.title)]),
          div(classes: 'command__box', [
            code(classes: 'command__code', [.text(command.command)]),
            button(
              classes: 'command__copy t-label-large',
              attributes: {
                'type': 'button',
                'data-copy': command.command,
                'data-label-copied': strings.useful_semanticsLabel_copied(command.title),
                'aria-label': strings.useful_semanticsLabel_copy(command.title),
              },
              [
                appIcon(AppIcon.copy, size: 18, classes: 'command__icon-copy'),
                appIcon(AppIcon.check, size: 18, classes: 'command__icon-copied'),
                span(classes: 'command__label-copy', [.text(strings.useful_copy)]),
                span(classes: 'command__label-copied', [.text(strings.useful_copied)]),
              ],
            ),
          ]),
        ]),
      ],
    ]),
  ]);
}
