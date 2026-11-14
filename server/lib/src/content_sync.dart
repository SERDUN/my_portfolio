import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'content_kind.dart';

/// Moves the content between the API and an assets directory laid out as
/// the app bundles it: `<dir>/<language>/<kind file>.json`.
class ContentSync {
  ContentSync(this.api, {http.Client? client}) : _client = client ?? http.Client();

  /// The API root, e.g. `https://api.example.com`.
  final Uri api;
  final http.Client _client;

  Uri _uri(String path, String language) => api.replace(path: '${api.path}$path', queryParameters: {'lang': language});

  /// Writes every kind of every language into [dir]. Fails before writing
  /// anything if a kind is missing or breaks the contract, so a build never
  /// ships half the content.
  Future<List<File>> pull(Directory dir) async {
    final files = <File, Object>{};
    for (final language in contentLanguages) {
      final response = await _client.get(_uri('/v1/bundle', language));
      if (response.statusCode != 200) throw ContentSyncException('GET bundle $language: ${response.statusCode}');
      final bundle = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      for (final kind in ContentKind.values) {
        final json = bundle[kind.name];
        if (json == null) throw ContentSyncException('the API has no ${kind.name} for $language');
        kind.validate(json);
        files[File('${dir.path}/$language/${kind.fileName}.json')] = json;
      }
    }
    for (final MapEntry(key: file, value: json) in files.entries) {
      await file.parent.create(recursive: true);
      await file.writeAsString('${const JsonEncoder.withIndent('  ').convert(json)}\n');
    }
    return files.keys.toList();
  }

  /// Uploads every file found in [dir] with [token]; missing files are
  /// skipped. Returns what was uploaded, as `<language>/<kind>`.
  Future<List<String>> push(Directory dir, String token) async {
    final pushed = <String>[];
    for (final language in contentLanguages) {
      for (final kind in ContentKind.values) {
        final file = File('${dir.path}/$language/${kind.fileName}.json');
        if (!file.existsSync()) continue;
        final body = await file.readAsString();
        kind.validate(jsonDecode(body));
        final response = await _client.put(
          _uri('/v1/${kind.name}', language),
          headers: {'authorization': 'Bearer $token', 'content-type': 'application/json; charset=utf-8'},
          body: body,
        );
        if (response.statusCode != 204) {
          throw ContentSyncException('PUT ${kind.name} $language: ${response.statusCode} ${response.body}');
        }
        pushed.add('$language/${kind.name}');
      }
    }
    return pushed;
  }

  void close() => _client.close();
}

class ContentSyncException implements Exception {
  ContentSyncException(this.message);

  final String message;

  @override
  String toString() => message;
}
