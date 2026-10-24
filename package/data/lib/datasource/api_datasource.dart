import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../dto/dto.dart';
import 'portfolio_data_source.dart';

/// A non-2xx answer from the API.
class ApiException implements Exception {
  ApiException(this.statusCode, this.uri);

  final int statusCode;
  final Uri uri;

  @override
  String toString() => 'ApiException($statusCode, $uri)';
}

/// Adds the JSON and owner headers to every request.
class ApiClient extends http.BaseClient {
  ApiClient(this._inner, this._customHeaders);

  final http.Client _inner;
  final Map<String, String> _customHeaders;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['content-type'] = 'application/json; charset=utf-8';
    request.headers['accept'] = 'application/json';
    request.headers.addAll(_customHeaders);
    return _inner.send(request);
  }
}

/// Fetches the content from the Cloud Functions API. Registered lazily in
/// every environment; only the api environment binds it as the source.
@lazySingleton
class ApiDatasource implements PortfolioDataSource {
  ApiDatasource({
    @Named('userId') required this.userId,
    @Named('baseUrl') required this.baseUrl,
    @ignoreParam http.Client? client,
  }) : _client = ApiClient(client ?? http.Client(), {'x-user-id': userId});

  final String userId;
  final Uri baseUrl;
  final http.Client _client;

  static const _userPath = '/user';
  static const _contactsPath = '/contacts';
  static const _skillsPath = '/skills';
  static const _projectsPath = '/projects';

  Uri _endpoint(String path) => baseUrl.replace(path: baseUrl.path + path);

  /// GETs [path] and decodes the body; non-2xx answers throw [ApiException]
  /// before any JSON is parsed, so an error object never becomes a DTO.
  Future<Object?> _get(String path, Language language) async {
    final uri = _endpoint(path);
    final response = await _client.get(uri, headers: {'accept-language': language.code});
    if (response.statusCode < 200 || response.statusCode >= 300) throw ApiException(response.statusCode, uri);
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  Future<List<T>> _getList<T>(String path, Language language, T Function(Map<String, dynamic>) fromJson) async {
    final json = await _get(path, language) as List;
    return json.map((item) => fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<ProjectDTO>> getProjects(Language language) => _getList(_projectsPath, language, ProjectDTO.fromJson);

  @override
  Future<ProjectDTO> getProject(String id, Language language) async {
    try {
      return ProjectDTO.fromJson(await _get('$_projectsPath/$id', language) as Map<String, dynamic>);
    } on ApiException catch (e) {
      if (e.statusCode == 404) throw ProjectNotFoundException(id);
      rethrow;
    }
  }

  @override
  Future<List<ContactDTO>> getContacts(Language language) => _getList(_contactsPath, language, ContactDTO.fromJson);

  @override
  Future<List<SkillGroupDTO>> getSkills(Language language) =>
      _getList(_skillsPath, language, SkillGroupDTO.fromJson);

  @override
  Future<PortfolioUserDTO> getUser(Language language) async =>
      PortfolioUserDTO.fromJson(await _get(_userPath, language) as Map<String, dynamic>);
}
