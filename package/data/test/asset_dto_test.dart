import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:data/data.dart';

/// Parses the JSON bundled under `assets/data/<lang>/` with the real DTOs.
///
/// Guards the asset files and the DTO schema together: a renamed key, a
/// missing required field or a malformed file in either language fails here.
/// `flutter test` runs with the package root as cwd, so the files are read
/// relative to it.
void main() {
  const languages = ['en', 'uk'];

  dynamic readJson(String language, String file) {
    final path = 'assets/data/$language/$file.json';
    final content = File(path).readAsStringSync();
    expect(content.trim(), isNotEmpty, reason: '$path is empty');
    return jsonDecode(content);
  }

  List<Map<String, dynamic>> readList(String language, String file) {
    final decoded = readJson(language, file);
    expect(decoded, isA<List>(), reason: '$file.json must be a JSON array');
    return (decoded as List).cast<Map<String, dynamic>>();
  }

  for (final language in languages) {
    group('assets/data/$language', () {
      test('contact.json parses into ContactsDTO', () {
        final contacts = readList(language, 'contact').map(ContactsDTO.fromJson).toList();

        expect(contacts, isNotEmpty);
        for (final contact in contacts) {
          expect(contact.title, isNotEmpty);
          expect(contact.value, isNotEmpty);
        }
        expect(contacts.map((c) => c.title), contains('Email'));
      });

      test('projects.json parses into ProjectDTO', () {
        final projects = readList(language, 'projects').map(ProjectDTO.fromJson).toList();

        expect(projects, isNotEmpty);
        for (final project in projects) {
          expect(project.id, isNotNull, reason: 'every project needs an id for routing');
          expect(project.id, isNotEmpty);
          expect(project.name, isNotNull);
          expect(project.name, isNotEmpty);
          expect(project.description, isNotNull);
        }
        final ids = projects.map((p) => p.id).toList();
        expect(ids.toSet().length, ids.length, reason: 'project ids must be unique');
      });

      test('skills.json parses into PortfolioSkillsDTO', () {
        final skills = readList(language, 'skills').map(PortfolioSkillsDTO.fromJson).toList();

        expect(skills, isNotEmpty);
        for (final skill in skills) {
          expect(skill.title, isNotEmpty);
        }
        expect(
          skills.any((skill) => skill.subskills.isNotEmpty),
          isTrue,
          reason: 'at least one top-level skill has sub-skills',
        );
      });

      test('useful_commands.json parses into UsefulCommandsDTO', () {
        final groups = readList(language, 'useful_commands').map(UsefulCommandsDTO.fromJson).toList();

        expect(groups, isNotEmpty);
        for (final group in groups) {
          expect(group.title, isNotEmpty);
          expect(group.commands, isNotEmpty);
          for (final command in group.commands) {
            expect(command.title, isNotEmpty);
            expect(command.command, isNotEmpty);
          }
        }
      });

      test('user.json parses into PortfolioUserDTO', () {
        final decoded = readJson(language, 'user');
        expect(decoded, isA<Map<String, dynamic>>());
        final user = PortfolioUserDTO.fromJson(decoded as Map<String, dynamic>);

        expect(user.firstName, isNotNull);
        expect(user.firstName, isNotEmpty);
        expect(user.secondName, isNotNull);
        expect(user.secondName, isNotEmpty);
        expect(user.position, isNotNull);
        expect(user.intro, isNotNull);
        expect(Uri.tryParse(user.avatarUrl ?? '')?.hasScheme, isTrue, reason: 'avatar_url must be an absolute URL');
        expect(Uri.tryParse(user.cvUrl ?? '')?.hasScheme, isTrue, reason: 'cv_url must be an absolute URL');
      });
    });
  }

  group('en and uk assets stay in sync', () {
    test('projects have the same ids in both languages', () {
      final en = readList('en', 'projects').map(ProjectDTO.fromJson).map((p) => p.id).toList();
      final uk = readList('uk', 'projects').map(ProjectDTO.fromJson).map((p) => p.id).toList();

      expect(uk, equals(en));
    });

    test('contacts have the same titles and values in both languages', () {
      final en = readList('en', 'contact').map(ContactsDTO.fromJson).map((c) => '${c.title}=${c.value}').toList();
      final uk = readList('uk', 'contact').map(ContactsDTO.fromJson).map((c) => '${c.title}=${c.value}').toList();

      expect(uk, equals(en));
    });

    test('skills and useful command groups have the same size in both languages', () {
      expect(readList('uk', 'skills').length, readList('en', 'skills').length);
      expect(readList('uk', 'useful_commands').length, readList('en', 'useful_commands').length);
    });
  });
}
