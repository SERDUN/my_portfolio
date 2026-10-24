import 'package:flutter_test/flutter_test.dart';

import 'package:data/data.dart';

/// Schema-level checks on the generated `fromJson` / `toJson` code with small
/// hand-built maps: defaults for absent lists, nullability, key names.
void main() {
  group('ProjectDTO', () {
    test('absent lists default to empty and absent strings to null', () {
      final dto = ProjectDTO.fromJson({'id': '7', 'name': 'App'});

      expect(dto.id, '7');
      expect(dto.name, 'App');
      expect(dto.intro, isNull);
      expect(dto.description, isNull);
      expect(dto.linkAndroid, isNull);
      expect(dto.linkIOS, isNull);
      expect(dto.linkGithub, isNull);
      expect(dto.spheres, isEmpty);
      expect(dto.technologies, isEmpty);
      expect(dto.screenshots, isEmpty);
      expect(dto.preview, isNull);
    });

    test('uses camelCase keys for links and survives a round trip', () {
      final json = {
        'id': '1',
        'name': 'Portfolio',
        'intro': 'intro',
        'description': 'desc',
        'linkAndroid': 'https://play.example/app',
        'linkIOS': 'https://apps.example/app',
        'linkGithub': 'https://github.com/example/app',
        'spheres': ['Web'],
        'technologies': ['Flutter', 'Dart'],
        'screenshots': ['https://img.example/1.png'],
        'preview': 'https://img.example/preview.png',
        'featured': true,
      };

      final dto = ProjectDTO.fromJson(json);

      expect(dto.featured, isTrue);

      expect(dto.linkAndroid, 'https://play.example/app');
      expect(dto.linkIOS, 'https://apps.example/app');
      expect(dto.linkGithub, 'https://github.com/example/app');
      expect(dto.technologies, ['Flutter', 'Dart']);
      expect(dto.toJson(), equals(json));
    });
  });

  group('PortfolioUserDTO', () {
    test('reads snake_case keys', () {
      final dto = PortfolioUserDTO.fromJson({
        'first_name': 'Dmitro',
        'second_name': 'Serdun',
        'avatar_url': 'https://img.example/avatar.webp',
        'cv_url': 'https://docs.example/cv',
        'position': 'Mobile Developer',
        'intro': 'Hi',
      });

      expect(dto.firstName, 'Dmitro');
      expect(dto.secondName, 'Serdun');
      expect(dto.avatarUrl, 'https://img.example/avatar.webp');
      expect(dto.cvUrl, 'https://docs.example/cv');
      expect(dto.position, 'Mobile Developer');
      expect(dto.intro, 'Hi');
    });

    test('tolerates an empty object and ignores unknown keys', () {
      final dto = PortfolioUserDTO.fromJson({'name': 'ignored'});

      expect(dto.firstName, isNull);
      expect(dto.secondName, isNull);
      expect(dto.toJson()['first_name'], isNull);
      expect(dto.toJson().containsKey('name'), isFalse);
    });
  });

  group('PortfolioSkillsDTO', () {
    test('parses nested subskills and optional expanded flag', () {
      final dto = PortfolioSkillsDTO.fromJson({
        'title': 'Flutter',
        'expanded': true,
        'subskills': [
          {'title': 'Bloc'},
          {
            'title': 'Testing',
            'subskills': [
              {'title': 'Widget tests'},
            ],
          },
        ],
      });

      expect(dto.title, 'Flutter');
      expect(dto.expanded, isTrue);
      expect(dto.subskills.map((s) => s.title), ['Bloc', 'Testing']);
      expect(dto.subskills[0].expanded, isNull);
      expect(dto.subskills[0].subskills, isEmpty);
      expect(dto.subskills[1].subskills.single.title, 'Widget tests');
    });

    test('requires a title', () {
      expect(() => PortfolioSkillsDTO.fromJson({'subskills': []}), throwsA(isA<TypeError>()));
    });
  });

  group('ContactsDTO', () {
    test('requires both title and value', () {
      final dto = ContactsDTO.fromJson({'title': 'Email', 'value': 'me@example.com'});

      expect(dto.title, 'Email');
      expect(dto.value, 'me@example.com');
      expect(() => ContactsDTO.fromJson({'title': 'Email'}), throwsA(isA<TypeError>()));
    });
  });

  group('UsefulCommandsDTO', () {
    test('parses a group with its commands', () {
      final dto = UsefulCommandsDTO.fromJson({
        'title': 'Git',
        'commands': [
          {'title': 'Status', 'command': 'git status'},
          {'title': 'Log', 'command': 'git log --oneline'},
        ],
      });

      expect(dto.title, 'Git');
      expect(dto.commands.map((c) => c.command), ['git status', 'git log --oneline']);
    });

    test('requires the commands list', () {
      expect(() => UsefulCommandsDTO.fromJson({'title': 'Git'}), throwsA(isA<TypeError>()));
    });
  });

  group('PortfolioDTO', () {
    test('parses an optional projects list', () {
      expect(PortfolioDTO.fromJson({}).projects, isNull);
      final dto = PortfolioDTO.fromJson({
        'projects': [
          {'id': '1', 'name': 'One'},
        ],
      });
      expect(dto.projects?.single.name, 'One');
    });
  });
}
