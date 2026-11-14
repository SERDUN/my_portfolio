@Tags(['postgres'])
library;

import 'dart:io';

import 'package:test/test.dart';

import 'package:portfolio_api/portfolio_api.dart';
import 'package:postgres/postgres.dart' show SslMode;

/// Runs only with `TEST_DATABASE_URL` pointing at a disposable database.
void main() {
  final url = Platform.environment['TEST_DATABASE_URL'];

  test('writes, overwrites and reads documents per kind and language', () async {
    final store = await PostgresContentStore.open(Uri.parse(url!), sslMode: SslMode.disable);
    addTearDown(store.close);

    await store.write(ContentKind.skills, 'en', [
      {'title': 'Mobile', 'subskills': []},
    ]);
    await store.write(ContentKind.skills, 'en', [
      {'title': 'Мобільна', 'subskills': []},
    ]);

    expect(await store.read(ContentKind.skills, 'en'), [
      {'title': 'Мобільна', 'subskills': []},
    ]);
    await store.write(ContentKind.skills, 'uk', []);
    expect(await store.read(ContentKind.skills, 'uk'), isEmpty);
    expect(await store.read(ContentKind.skills, 'en'), hasLength(1));
  }, skip: url == null ? 'TEST_DATABASE_URL is not set' : false);
}
