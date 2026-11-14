import 'package:postgres/postgres.dart';

import 'content_kind.dart';

/// Where the content documents are kept: one JSON document per kind and
/// language.
abstract class ContentStore {
  /// The stored document, or null when none was written yet.
  Future<Object?> read(ContentKind kind, String language);

  /// Replaces the document. Callers validate it first.
  Future<void> write(ContentKind kind, String language, Object json);

  Future<void> close() async {}
}

/// Keeps the documents in memory: tests and local runs without a database.
class MemoryContentStore extends ContentStore {
  final Map<(ContentKind, String), Object> _documents = {};

  @override
  Future<Object?> read(ContentKind kind, String language) async => _documents[(kind, language)];

  @override
  Future<void> write(ContentKind kind, String language, Object json) async => _documents[(kind, language)] = json;
}

/// Keeps the documents in one PostgreSQL table, created on [open]. The
/// column is `json`, not `jsonb`, so a document reads back with its keys in
/// the order they were written and the pulled asset files diff cleanly.
class PostgresContentStore extends ContentStore {
  PostgresContentStore._(this._pool);

  final Pool<void> _pool;

  /// Connects to [databaseUrl] (`postgresql://user:password@host:port/db`).
  /// TLS follows [sslMode], else the URL's `?sslmode=disable|require`, else
  /// it is off on Railway's private network and required elsewhere.
  static Future<PostgresContentStore> open(Uri databaseUrl, {SslMode? sslMode}) async {
    final userInfo = databaseUrl.userInfo.split(':');
    final endpoint = Endpoint(
      host: databaseUrl.host,
      port: databaseUrl.hasPort ? databaseUrl.port : 5432,
      database: databaseUrl.pathSegments.isEmpty ? 'postgres' : databaseUrl.pathSegments.first,
      username: Uri.decodeComponent(userInfo.first),
      password: userInfo.length > 1 ? Uri.decodeComponent(userInfo.sublist(1).join(':')) : null,
    );
    final mode =
        sslMode ??
        switch (databaseUrl.queryParameters['sslmode']) {
          'disable' => SslMode.disable,
          'require' => SslMode.require,
          'verify-full' => SslMode.verifyFull,
          _ => databaseUrl.host.endsWith('.railway.internal') ? SslMode.disable : SslMode.require,
        };
    final pool = Pool<void>.withEndpoints([endpoint], settings: PoolSettings(maxConnectionCount: 4, sslMode: mode));
    final store = PostgresContentStore._(pool);
    await store._migrate();
    return store;
  }

  Future<void> _migrate() => _pool.execute('''
    CREATE TABLE IF NOT EXISTS content_documents (
      kind text NOT NULL,
      language text NOT NULL,
      body json NOT NULL,
      updated_at timestamptz NOT NULL DEFAULT now(),
      PRIMARY KEY (kind, language)
    )
  ''');

  @override
  Future<Object?> read(ContentKind kind, String language) async {
    final result = await _pool.execute(
      Sql.named('SELECT body FROM content_documents WHERE kind = @kind AND language = @language'),
      parameters: {'kind': kind.name, 'language': language},
    );
    return result.isEmpty ? null : result.first.first;
  }

  @override
  Future<void> write(ContentKind kind, String language, Object json) async {
    await _pool.execute(
      Sql.named('''
        INSERT INTO content_documents (kind, language, body, updated_at)
        VALUES (@kind, @language, @body:json, now())
        ON CONFLICT (kind, language) DO UPDATE SET body = EXCLUDED.body, updated_at = now()
      '''),
      parameters: {'kind': kind.name, 'language': language, 'body': json},
    );
  }

  @override
  Future<void> close() => _pool.close();
}
