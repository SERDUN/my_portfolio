import 'package:flutter_test/flutter_test.dart';

import 'package:data/data.dart';

/// DTO → domain model mapping, the only place where both shapes meet.
void main() {
  group('ContactsDTO.toDomain', () {
    test('copies title and value', () {
      final model = ContactsDTO('Email', 'me@example.com').toDomain();

      expect(model.title, 'Email');
      expect(model.value, 'me@example.com');
    });

    test('maps a list in order', () {
      final models = [ContactsDTO('A', '1'), ContactsDTO('B', '2')].toDomain();

      expect(models.map((m) => m.title), ['A', 'B']);
    });
  });

  group('PortfolioSkillsDTO.toDomain', () {
    test('maps the tree recursively and defaults expanded to false', () {
      final dto = PortfolioSkillsDTO(
        title: 'Flutter',
        subskills: [
          PortfolioSkillsDTO(title: 'Bloc')..expanded = true,
          PortfolioSkillsDTO(
            title: 'Testing',
            subskills: [PortfolioSkillsDTO(title: 'Widget tests')],
          ),
        ],
      );

      final model = dto.toDomain();

      expect(model.title, 'Flutter');
      expect(model.expanded, isFalse);
      expect(model.children.map((c) => c.title), ['Bloc', 'Testing']);
      expect(model.children[0].expanded, isTrue);
      expect(model.children[0].children, isEmpty);
      expect(model.children[1].children.single.title, 'Widget tests');
    });
  });

  group('PortfolioUserDTO.toDomain', () {
    test('copies all fields', () {
      final model = PortfolioUserDTO(
        firstName: 'Dmitro',
        secondName: 'Serdun',
        position: 'Mobile Developer',
        location: 'Odesa',
        headline: 'Apps on every screen.',
        headlineAccent: 'every screen',
        experienceSince: 2019,
        intro: 'Hi',
        avatarUrl: 'https://img.example/avatar.webp',
        cvUrl: 'https://docs.example/cv',
      ).toDomain();

      expect(model.firstName, 'Dmitro');
      expect(model.secondName, 'Serdun');
      expect(model.position, 'Mobile Developer');
      expect(model.location, 'Odesa');
      expect(model.headline, 'Apps on every screen.');
      expect(model.headlineAccent, 'every screen');
      expect(model.experienceSince, 2019);
      expect(model.intro, 'Hi');
      expect(model.avatar, 'https://img.example/avatar.webp');
      expect(model.cv, 'https://docs.example/cv');
    });

    test('replaces missing fields with empty strings', () {
      final model = PortfolioUserDTO().toDomain();

      expect(model.firstName, '');
      expect(model.secondName, '');
      expect(model.position, '');
      expect(model.location, '');
      expect(model.headline, '');
      expect(model.intro, '');
      expect(model.avatar, '');
      expect(model.cv, '');
      expect(model.experienceSince, isNull);
    });
  });

  group('ProjectDTO.toDomain', () {
    test('copies fields, trims the description and defaults links to empty strings', () {
      final model = ProjectDTO(
        id: '3',
        name: 'App',
        intro: 'intro',
        description: '  multi\nline  \n',
        linkGithub: 'https://github.com/example/app',
        spheres: const ['Web'],
        technologies: const ['Flutter'],
        screenshots: const ['https://img.example/1.png'],
        preview: 'https://img.example/preview.png',
        featured: true,
      ).toDomain();

      expect(model.id, '3');
      expect(model.name, 'App');
      expect(model.intro, 'intro');
      expect(model.description, 'multi\nline');
      expect(model.linkAndroid, '');
      expect(model.linkIOS, '');
      expect(model.linkGithub, 'https://github.com/example/app');
      expect(model.spheres, ['Web']);
      expect(model.technologies, ['Flutter']);
      expect(model.screenshots, ['https://img.example/1.png']);
      expect(model.preview, 'https://img.example/preview.png');
      expect(model.featured, isTrue);
    });

    test('keeps a missing description as null', () {
      expect(ProjectDTO(id: '1').toDomain().description, isNull);
    });
  });

  group('UsefulCommandsDTO.toDomain', () {
    test('maps a group with its commands', () {
      final model = UsefulCommandsDTO('Git', [
        UsefulCommandDTO('Status', 'git status'),
        UsefulCommandDTO('Log', 'git log'),
      ]).toDomain();

      expect(model.title, 'Git');
      expect(model.commands.map((c) => '${c.title}:${c.command}'), ['Status:git status', 'Log:git log']);
    });
  });
}
