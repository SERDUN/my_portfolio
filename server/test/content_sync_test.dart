import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf_io.dart' as io;
import 'package:test/test.dart';

import 'package:portfolio_api/portfolio_api.dart';

/// Round trip over a real socket: push the app's bundled assets into the
/// API, pull them into a fresh directory, and get the same JSON back.
void main() {
  final assets = Directory('../package/data/assets/data');
  late HttpServer server;
  late ContentSync sync;
  late Directory out;

  setUp(() async {
    server = await io.serve(buildApi(MemoryContentStore(), adminToken: 'secret'), InternetAddress.loopbackIPv4, 0);
    sync = ContentSync(Uri.parse('http://${server.address.host}:${server.port}'));
    out = await Directory.systemTemp.createTemp('content_sync_test');
  });

  tearDown(() async {
    sync.close();
    await server.close(force: true);
    await out.delete(recursive: true);
  });

  test('pull refuses to write anything while a kind is missing', () async {
    await expectLater(sync.pull(out), throwsA(isA<ContentSyncException>()));
    expect(out.listSync(), isEmpty);
  });

  test('push then pull gives back every bundled file unchanged', () async {
    final pushed = await sync.push(assets, 'secret');
    expect(pushed, hasLength(contentLanguages.length * ContentKind.values.length));

    final files = await sync.pull(out);
    expect(files, hasLength(pushed.length));
    for (final language in contentLanguages) {
      for (final kind in ContentKind.values) {
        final name = '$language/${kind.fileName}.json';
        final original = jsonDecode(File('${assets.path}/$name').readAsStringSync());
        final pulled = jsonDecode(File('${out.path}/$name').readAsStringSync());
        expect(pulled, original, reason: name);
      }
    }
  });

  test('push with a wrong token fails', () async {
    await expectLater(sync.push(assets, 'wrong'), throwsA(isA<ContentSyncException>()));
  });
}
