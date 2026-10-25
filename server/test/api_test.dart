import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:portfolio_api/portfolio_api.dart';

const _token = 'secret';

void main() {
  late MemoryContentStore store;
  late Handler api;

  setUp(() {
    store = MemoryContentStore();
    api = buildApi(store, adminToken: _token);
  });

  Future<Response> get(String path, {Map<String, String>? headers}) =>
      Future.value(api(Request('GET', Uri.parse('http://api$path'), headers: headers)));

  Future<Response> put(String path, Object? body, {String? token = _token}) => Future.value(
    api(
      Request(
        'PUT',
        Uri.parse('http://api$path'),
        body: body is String ? body : jsonEncode(body),
        headers: {if (token != null) 'authorization': 'Bearer $token'},
      ),
    ),
  );

  Future<Object?> bodyOf(Response response) async => jsonDecode(await response.readAsString());

  final user = {'first_name': 'Dmytro', 'second_name': 'Serdun', 'position': 'Senior Mobile Developer'};
  final projects = [
    {'id': '1', 'name': 'One', 'platform': 'flutter'},
    {'id': '2', 'name': 'Two', 'platform': 'android'},
  ];

  test('health answers ok', () async {
    expect((await get('/health')).statusCode, 200);
  });

  test('a document that was never written is a 404', () async {
    expect((await get('/v1/user')).statusCode, 404);
  });

  test('an unknown kind is a 404 and an unknown language a 400', () async {
    expect((await get('/v1/nope')).statusCode, 404);
    expect((await get('/v1/user?lang=de')).statusCode, 400);
  });

  test('a written document reads back per language', () async {
    expect((await put('/v1/user?lang=en', user)).statusCode, 204);
    expect((await put('/v1/user?lang=uk', {...user, 'first_name': 'Дмитро'})).statusCode, 204);

    expect(await bodyOf(await get('/v1/user')), user);
    expect(((await bodyOf(await get('/v1/user?lang=uk'))) as Map)['first_name'], 'Дмитро');
    final viaHeader = await get('/v1/user', headers: {'accept-language': 'uk-UA,uk;q=0.9,en;q=0.8'});
    expect(((await bodyOf(viaHeader)) as Map)['first_name'], 'Дмитро');
  });

  test('writes need the token', () async {
    expect((await put('/v1/user?lang=en', user, token: null)).statusCode, 401);
    expect((await put('/v1/user?lang=en', user, token: 'wrong')).statusCode, 401);
    expect(await store.read(ContentKind.user, 'en'), isNull);
  });

  test('without a configured token the API is read-only', () async {
    api = buildApi(store);
    expect((await put('/v1/user?lang=en', user)).statusCode, 405);
  });

  test('a write needs an explicit supported language', () async {
    expect((await put('/v1/user', user)).statusCode, 400);
    expect((await put('/v1/user?lang=de', user)).statusCode, 400);
  });

  test('documents that break the contract are rejected', () async {
    expect((await put('/v1/user?lang=en', 'not json')).statusCode, 400);
    expect((await put('/v1/user?lang=en', [user])).statusCode, 422);
    expect((await put('/v1/user?lang=en', {'second_name': 'Serdun'})).statusCode, 422);
    expect(
      (await put('/v1/contacts?lang=en', [
        {'title': 'Email'},
      ])).statusCode,
      422,
    );
    expect((await put('/v1/projects?lang=en', [projects.first, projects.first])).statusCode, 422);
    expect(
      (await put('/v1/projects?lang=en', [
        {'id': '3'},
      ])).statusCode,
      422,
    );
  });

  test('one project reads by id', () async {
    await put('/v1/projects?lang=en', projects);

    expect(((await bodyOf(await get('/v1/projects/2'))) as Map)['name'], 'Two');
    expect((await get('/v1/projects/9')).statusCode, 404);
  });

  test('the bundle has every written kind of one language', () async {
    await put('/v1/user?lang=en', user);
    await put('/v1/projects?lang=en', projects);

    final bundle = (await bodyOf(await get('/v1/bundle?lang=en'))) as Map;
    expect(bundle.keys, unorderedEquals(['user', 'projects']));
    expect(bundle['projects'], projects);
  });

  test('answers carry CORS headers and preflight succeeds', () async {
    final preflight = await api(Request('OPTIONS', Uri.parse('http://api/v1/user')));
    expect(preflight.statusCode, 200);
    expect((await get('/health')).headers['access-control-allow-origin'], '*');
  });
}
