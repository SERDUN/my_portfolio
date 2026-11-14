import 'package:test/test.dart';

import 'package:domain/domain.dart';

import 'package:presentation/presentation.dart';

void main() {
  group('ProjectsState.platformCounts', () {
    test('counts each platform in order of first appearance and skips projects without one', () {
      final state = ProjectsState(
        projects: [
          ProjectModel(id: '1', name: 'a', platform: ProjectPlatform.android),
          ProjectModel(id: '2', name: 'b', platform: ProjectPlatform.flutter),
          ProjectModel(id: '3', name: 'c', platform: ProjectPlatform.android),
          ProjectModel(id: '4', name: 'd'),
        ],
      );
      expect(state.platformCounts.entries.map((e) => (e.key, e.value)), [
        (ProjectPlatform.android, 2),
        (ProjectPlatform.flutter, 1),
      ]);
    });
  });

  group('publishedPlatforms', () {
    test('iOS, Android and the web from the store links and the technologies', () {
      final project = ProjectModel(
        id: '1',
        name: 'a',
        links: ProjectLinks(appStore: Uri.parse('https://apps.apple.com/x'), googlePlay: Uri.parse('https://play/x')),
        technologies: const ['Flutter', 'Web'],
      );
      expect(publishedPlatforms(project), [PublishedPlatform.ios, PublishedPlatform.android, PublishedPlatform.web]);
    });

    test('none without store links or a web technology', () {
      expect(publishedPlatforms(ProjectModel(id: '1', name: 'a', technologies: const ['Kotlin'])), isEmpty);
    });
  });

  group('ContactAddress.shownAddress', () {
    test('drops the scheme and www', () {
      expect(ContactModel(title: 'GitHub', value: 'https://www.github.com/SERDUN').shownAddress, 'github.com/SERDUN');
      expect(ContactModel(title: 'Telegram', value: 'http://t.me/x').shownAddress, 't.me/x');
    });

    test('leaves an email or a bare value as it is', () {
      expect(ContactModel(title: 'Email', value: 'a@b.c').shownAddress, 'a@b.c');
    });
  });
}
