import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'content_kind.dart';
import 'content_store.dart';

/// The HTTP API over [store].
///
/// Reads are public: `GET /v1/<kind>`, `GET /v1/projects/<id>` and
/// `GET /v1/bundle`, the language from `?lang=` or `Accept-Language`
/// (en by default). Writes replace one document, `PUT /v1/<kind>?lang=`,
/// and need `Authorization: Bearer <adminToken>`; without a token the API
/// is read-only.
Handler buildApi(ContentStore store, {String? adminToken}) {
  final router = Router()
    ..get('/health', (Request request) => Response.ok('ok'))
    ..get('/v1/bundle', (Request request) => _bundle(store, request))
    ..get('/v1/projects/<id>', (Request request, String id) => _project(store, request, id))
    ..get('/v1/<kind>', (Request request, String kind) => _read(store, request, kind))
    ..put('/v1/<kind>', (Request request, String kind) => _write(store, request, kind, adminToken));
  return const Pipeline().addMiddleware(_cors()).addHandler(router.call);
}

Future<Response> _read(ContentStore store, Request request, String name) async {
  final kind = ContentKind.byName(name);
  if (kind == null) return _error(404, 'unknown content "$name"');
  final language = _language(request);
  if (language == null) return _unsupportedLanguage();
  final json = await store.read(kind, language);
  if (json == null) return _error(404, 'no $name for $language yet');
  return _json(json);
}

Future<Response> _project(ContentStore store, Request request, String id) async {
  final language = _language(request);
  if (language == null) return _unsupportedLanguage();
  final projects = await store.read(ContentKind.projects, language);
  if (projects is List) {
    for (final project in projects) {
      if (project is Map && project['id'] == id) return _json(project);
    }
  }
  return _error(404, 'no project "$id"');
}

/// Every kind for one language in one object keyed by kind; what the build
/// pulls. Kinds not written yet are left out.
Future<Response> _bundle(ContentStore store, Request request) async {
  final language = _language(request);
  if (language == null) return _unsupportedLanguage();
  final bundle = <String, Object>{};
  for (final kind in ContentKind.values) {
    final json = await store.read(kind, language);
    if (json != null) bundle[kind.name] = json;
  }
  return _json(bundle);
}

Future<Response> _write(ContentStore store, Request request, String name, String? adminToken) async {
  if (adminToken == null || adminToken.isEmpty) return _error(405, 'this API is read-only');
  if (request.headers['authorization'] != 'Bearer $adminToken') return _error(401, 'missing or wrong token');
  final kind = ContentKind.byName(name);
  if (kind == null) return _error(404, 'unknown content "$name"');
  final language = request.url.queryParameters['lang'];
  if (language == null || !contentLanguages.contains(language)) return _unsupportedLanguage();

  final Object? json;
  try {
    json = jsonDecode(await request.readAsString());
  } on FormatException catch (e) {
    return _error(400, 'body is not JSON: ${e.message}');
  }
  try {
    kind.validate(json);
  } on ContentValidationException catch (e) {
    return _error(422, e.message);
  }
  await store.write(kind, language, json!);
  return Response(204);
}

/// `?lang=` wins over `Accept-Language`; null for a language we do not have.
String? _language(Request request) {
  final query = request.url.queryParameters['lang'];
  if (query != null) return contentLanguages.contains(query) ? query : null;
  final header = request.headers['accept-language'];
  if (header == null || header.isEmpty) return contentLanguages.first;
  for (final part in header.split(',')) {
    final code = part.split(';').first.trim().split('-').first.toLowerCase();
    if (contentLanguages.contains(code)) return code;
  }
  return contentLanguages.first;
}

Response _json(Object json) =>
    Response.ok(jsonEncode(json), headers: {'content-type': 'application/json; charset=utf-8'});

Response _error(int status, String message) => Response(
  status,
  body: jsonEncode({'error': message}),
  headers: {'content-type': 'application/json; charset=utf-8'},
);

Response _unsupportedLanguage() => _error(400, 'lang must be one of ${contentLanguages.join(', ')}');

/// Lets the web app read the API from the browser; writes stay
/// token-guarded, so any origin is fine.
Middleware _cors() {
  const headers = {
    'access-control-allow-origin': '*',
    'access-control-allow-methods': 'GET, PUT, OPTIONS',
    'access-control-allow-headers': 'authorization, content-type, accept, accept-language, x-user-id',
  };
  return (inner) => (request) async {
    if (request.method == 'OPTIONS') return Response.ok(null, headers: headers);
    final response = await inner(request);
    return response.change(headers: headers);
  };
}
