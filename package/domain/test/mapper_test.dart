import 'package:flutter_test/flutter_test.dart';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

void main() {
  group('ContactMapper', () {
    final mapper = ContactMapper();

    test('copies title and value', () {
      final model = mapper.mapToModel(ContactsDTO('Email', 'me@example.com'));

      expect(model.title, 'Email');
      expect(model.value, 'me@example.com');
    });

    test('mapToModels maps every element in order', () {
      final models = mapper.mapToModels([ContactsDTO('A', '1'), ContactsDTO('B', '2')]);

      expect(models.map((m) => m.title), ['A', 'B']);
    });
  });

  group('PortfolioSkillsMapper', () {
    final mapper = PortfolioSkillsMapper();

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

      final model = mapper.mapToModel(dto);

      expect(model.title, 'Flutter');
      expect(model.expanded, isFalse);
      expect(model.children.map((c) => c.title), ['Bloc', 'Testing']);
      expect(model.children[0].expanded, isTrue);
      expect(model.children[0].children, isEmpty);
      expect(model.children[1].children.single.title, 'Widget tests');
    });
  });

  group('PortfolioUserMapper', () {
    final mapper = PortfolioUserMapper(PortfolioSkillsMapper());

    test('copies all fields', () {
      final model = mapper.mapToModel(PortfolioUserDTO(
        firstName: 'Dmitro',
        secondName: 'Serdun',
        position: 'Mobile Developer',
        intro: 'Hi',
        avatarUrl: 'https://img.example/avatar.webp',
        cvUrl: 'https://docs.example/cv',
      ));

      expect(model.firstName, 'Dmitro');
      expect(model.secondName, 'Serdun');
      expect(model.position, 'Mobile Developer');
      expect(model.intro, 'Hi');
      expect(model.avatar, 'https://img.example/avatar.webp');
      expect(model.cv, 'https://docs.example/cv');
    });

    test('replaces missing fields with empty strings', () {
      final model = mapper.mapToModel(PortfolioUserDTO());

      expect(model.firstName, '');
      expect(model.secondName, '');
      expect(model.position, '');
      expect(model.intro, '');
      expect(model.avatar, '');
      expect(model.cv, '');
    });
  });

  group('ProjectMapper', () {
    final mapper = ProjectMapper();

    test('copies fields, trims the description and defaults links to empty strings', () {
      final model = mapper.mapToModel(ProjectDTO(
        id: '3',
        name: 'App',
        intro: 'intro',
        description: '  multi\nline  \n',
        linkGithub: 'https://github.com/example/app',
        spheres: const ['Web'],
        technologies: const ['Flutter'],
        screenshots: const ['https://img.example/1.png'],
        preview: 'https://img.example/preview.png',
      ));

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
    });

    test('keeps a missing description as null', () {
      expect(mapper.mapToModel(ProjectDTO(id: '1')).description, isNull);
    });
  });

  group('UsefulCommandsMapper', () {
    final mapper = UsefulCommandsMapper();

    test('maps a group with its commands in both directions', () {
      final dto = UsefulCommandsDTO('Git', [
        UsefulCommandDTO('Status', 'git status'),
        UsefulCommandDTO('Log', 'git log'),
      ]);

      final model = mapper.mapToModel(dto);
      expect(model.title, 'Git');
      expect(model.commands.map((c) => '${c.title}:${c.command}'), ['Status:git status', 'Log:git log']);

      final back = mapper.mapToDto(model);
      expect(back.title, dto.title);
      expect(back.commands.map((c) => c.command), dto.commands.map((c) => c.command));
    });
  });
}
