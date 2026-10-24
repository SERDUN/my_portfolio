import 'package:data/data.dart';

/// Reads the data source chosen at build time:
/// `flutter build web --dart-define=DATA_SOURCE=api`. Names and validation
/// live in [DataEnvironment]; this only bridges the compile-time define.
abstract final class AppEnvironment {
  static const String _define = String.fromEnvironment('DATA_SOURCE');

  static String fromBuild() => DataEnvironment.fromName(_define);
}
