import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/keys.dart';
import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/features/useful/widgets/command_tile.dart';
import 'package:my_portfolio/style/style.dart';

import 'helpers/semantics.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('PillButton: one node with label, id and tap; activates via semantics', (tester) async {
    final handle = tester.ensureSemantics();
    var taps = 0;
    await tester.pumpWidget(
      testHost(PillButton(label: 'Download CV', identifier: homeDownloadCvId, onPressed: () => taps++)),
    );

    expectTapTargetSemantics(
      tester,
      findSemanticsId(homeDownloadCvId),
      label: 'Download CV',
      identifier: homeDownloadCvId,
      isButton: true,
    );
    await tapViaSemantics(tester, findSemanticsId(homeDownloadCvId));
    expect(taps, 1);
    handle.dispose();
  });

  testWidgets('LanguageToggle: each pill is named by its language and carries its id', (tester) async {
    final handle = tester.ensureSemantics();
    Language? chosen;
    await tester.pumpWidget(
      testHost(
        LanguageToggle(
          current: Language.en,
          onChanged: (l) => chosen = l,
          optionIdentifier: (l) => shellLanguageOptionId(l.code),
        ),
      ),
    );

    expectTapTargetSemantics(
      tester,
      findSemanticsId(shellLanguageOptionId('uk')),
      label: 'UK, Українська',
      identifier: shellLanguageOptionId('uk'),
      isButton: true,
    );
    expect(
      tester.getSemantics(findSemanticsId(shellLanguageOptionId('en'))),
      isSemantics(label: 'EN, English', isSelected: true, hasTapAction: true),
    );
    await tapViaSemantics(tester, findSemanticsId(shellLanguageOptionId('uk')));
    expect(chosen, Language.uk);
    handle.dispose();
  });

  testWidgets('ProjectCard: the whole card is one named, identified tap target', (tester) async {
    final handle = tester.ensureSemantics();
    var opened = 0;
    await tester.pumpWidget(
      testHost(
        SingleChildScrollView(
          child: ProjectCard(
            project: ProjectModel(
              id: '7',
              name: 'Lune',
              intro: 'A taxi app',
              platform: ProjectPlatform.flutter,
              technologies: const ['Flutter', 'BLoC'],
            ),
            identifier: projectsCardId('7'),
            onOpen: () => opened++,
          ),
        ),
      ),
    );

    expectTapTargetSemantics(
      tester,
      findSemanticsId(projectsCardId('7')),
      label: 'Lune. A taxi app. Flutter. BLoC',
      identifier: projectsCardId('7'),
      isButton: true,
    );
    await tapViaSemantics(tester, findSemanticsId(projectsCardId('7')));
    expect(opened, 1);
    handle.dispose();
  });

  testWidgets('the copy button keeps its id across languages and announces the copy', (tester) async {
    final handle = tester.ensureSemantics();
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (_) async => null);
    addTearDown(() => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, null));

    await tester.pumpWidget(
      testHost(
        const CommandTile(title: 'Позначити версію', command: 'git tag v1.0'),
        locale: const Locale('uk'),
      ),
    );

    final id = usefulCopyId('git tag v1.0');
    expect(id, 'useful_copy_git_tag_v1_0');
    expectTapTargetSemantics(
      tester,
      findSemanticsId(id),
      label: 'Копіювати: Позначити версію',
      identifier: id,
      isButton: true,
    );

    await tapViaSemantics(tester, findSemanticsId(id));
    await tester.pump();
    expect(tester.getSemantics(findSemanticsId(id)), isSemantics(label: 'Скопійовано: Позначити версію'));
    await tester.pump(const Duration(seconds: 3));
    handle.dispose();
  });

  test('every literal id in keys.dart is unique', () {
    final source = File('lib/app/keys.dart').readAsStringSync();
    final literals = RegExp(r"=\s*'([a-z0-9_]+)';").allMatches(source).map((m) => m.group(1)!).toList();
    expect(literals, isNotEmpty);
    expect(literals.toSet().length, literals.length);
  });

  test('keySlug gives stable, readable ids', () {
    expect(keySlug('Lune Café'), 'lune_caf');
    expect(keySlug('  GitHub '), 'github');
    expect(projectsCardId('Columbus Coffee'), 'projects_card_columbus_coffee');
  });
}
