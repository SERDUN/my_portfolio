/// Injectable environment names that pick the [PortfolioDataSource]. The one
/// list of names: the app reads the build define through [fromName].
abstract final class DataEnvironment {
  /// Content read from the JSON bundled under `assets/data/`. The default.
  static const String assets = 'assets';

  /// Content fetched from the Cloud Functions API, with the bundled JSON as
  /// the fallback when a request fails.
  static const String api = 'api';

  static const List<String> all = [assets, api];

  /// Validates a name from configuration. An empty value means [assets]; an
  /// unknown one throws, so a mistyped `--dart-define` fails at startup
  /// instead of silently shipping the wrong source.
  static String fromName(String name) {
    final normalized = name.trim().toLowerCase();
    if (normalized.isEmpty) return assets;
    if (all.contains(normalized)) return normalized;
    throw ArgumentError.value(name, 'DATA_SOURCE', 'expected one of ${all.join(', ')}');
  }
}
