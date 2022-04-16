class AppEnvironmentKey {
  /// name of the environment
  final String name;

  /// default constructor
  const AppEnvironmentKey(this.name);

  /// preset of common env name 'stage'
  static const stage = 'stage';

  /// preset of common env name 'dev'
  static const dev = 'dev';

  /// preset of common env name 'prod'
  static const prod = 'prod';
}
