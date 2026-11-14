import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

/// A source that always throws [error], for the fallback tests.
class _FailingSource implements PortfolioDataSource {
  _FailingSource(this.error);

  final Object error;

  @override
  Future<List<ContactDTO>> getContacts(Language language) => Future.error(error);
  @override
  Future<ProjectDTO> getProject(String id, Language language) => Future.error(error);
  @override
  Future<List<ProjectDTO>> getProjects(Language language) => Future.error(error);
  @override
  Future<List<SkillGroupDTO>> getSkills(Language language) => Future.error(error);
  @override
  Future<PortfolioUserDTO> getUser(Language language) => Future.error(error);
}

ApiDatasource _api(MockClientHandler handler) =>
    ApiDatasource(baseUrl: Uri.parse('https://api.example/v1'), client: MockClient(handler));

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FallbackDataSource', () {
    test('answers from the fallback when the primary fails', () async {
      final source = FallbackDataSource(
        primary: _FailingSource(ApiException(503, Uri())),
        fallback: AssetsDataSource(),
      );

      expect(await source.getProjects(Language.en), isNotEmpty);
      expect((await source.getUser(Language.uk)).firstName, isNotEmpty);
    });

    test('does not retry a missing project', () async {
      final source = FallbackDataSource(
        primary: _FailingSource(const ProjectNotFoundException('x')),
        fallback: AssetsDataSource(),
      );

      expect(source.getProject('x', Language.en), throwsA(isA<ProjectNotFoundException>()));
    });
  });

  group('ApiDatasource', () {
    test('sends the language and owner headers and decodes UTF-8', () async {
      late http.Request seen;
      final api = _api((request) async {
        seen = request;
        return http.Response.bytes(utf8.encode('[{"title":"Пошта","value":"x"}]'), 200);
      });

      final contacts = await api.getContacts(Language.uk);

      expect(contacts.single.title, 'Пошта');
      expect(seen.url.toString(), 'https://api.example/v1/contacts');
      expect(seen.headers['accept-language'], 'uk');
    });

    test('throws ApiException on a non-2xx answer instead of parsing it', () {
      final api = _api((_) async => http.Response('{"error":"boom"}', 500));

      expect(api.getUser(Language.en), throwsA(isA<ApiException>().having((e) => e.statusCode, 'status', 500)));
      expect(api.getProjects(Language.en), throwsA(isA<ApiException>()));
    });

    test('maps a 404 on one project to ProjectNotFoundException', () {
      final api = _api((_) async => http.Response('<html>not found</html>', 404));

      expect(api.getProject('nope', Language.en), throwsA(isA<ProjectNotFoundException>()));
    });
  });
}
