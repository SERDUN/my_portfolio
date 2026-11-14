import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'package:portfolio_api/portfolio_api.dart';

/// Serves the content API. Environment: `PORT` (8080), `DATABASE_URL`
/// (in-memory store when unset, for local runs), `ADMIN_TOKEN` (read-only
/// when unset).
Future<void> main() async {
  final env = Platform.environment;
  final databaseUrl = env['DATABASE_URL'];
  final store = databaseUrl == null || databaseUrl.isEmpty
      ? MemoryContentStore()
      : await PostgresContentStore.open(Uri.parse(databaseUrl));
  if (store is MemoryContentStore) stderr.writeln('DATABASE_URL is not set: content lives in memory only');

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(buildApi(store, adminToken: env['ADMIN_TOKEN']));
  final server = await io.serve(handler, InternetAddress.anyIPv4, int.parse(env['PORT'] ?? '8080'));
  stdout.writeln('portfolio api on :${server.port}');

  ProcessSignal.sigterm.watch().first.then((_) async {
    await server.close();
    await store.close();
    exit(0);
  });
}
