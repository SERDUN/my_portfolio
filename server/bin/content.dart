import 'dart:io';

import 'package:args/args.dart';

import 'package:portfolio_api/portfolio_api.dart';

const _usage = '''
Moves the portfolio content between the API and the app assets.

  dart run bin/content.dart pull --api <url> [--dir <assets>]
  dart run bin/content.dart push --api <url> [--dir <assets>]   (token in PORTFOLIO_API_TOKEN)

<assets> defaults to ../package/data/assets/data.''';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('api', help: 'API root URL')
    ..addOption('dir', defaultsTo: '../package/data/assets/data');
  final ArgResults args;
  try {
    args = parser.parse(arguments);
  } on FormatException catch (e) {
    _fail('${e.message}\n\n$_usage');
  }
  final command = args.rest.isEmpty ? null : args.rest.first;
  final api = args.option('api');
  if (command == null || api == null || !{'pull', 'push'}.contains(command)) _fail(_usage);

  final sync = ContentSync(Uri.parse(api));
  final dir = Directory(args.option('dir')!);
  try {
    if (command == 'pull') {
      final files = await sync.pull(dir);
      stdout.writeln('pulled ${files.length} files into ${dir.path}');
    } else {
      final token = Platform.environment['PORTFOLIO_API_TOKEN'];
      if (token == null || token.isEmpty) _fail('PORTFOLIO_API_TOKEN is not set');
      final pushed = await sync.push(dir, token);
      stdout.writeln('pushed ${pushed.length} documents: ${pushed.join(', ')}');
    }
  } on Exception catch (e) {
    _fail('$command failed: $e');
  } finally {
    sync.close();
  }
}

Never _fail(String message) {
  stderr.writeln(message);
  exit(64);
}
