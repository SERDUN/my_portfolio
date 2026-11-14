import 'package:domain/domain.dart';

/// Presentation of [ProjectPlatform]. The names are brand names, so they
/// stay literal in every language.
extension ProjectPlatformX on ProjectPlatform {
  String get label => switch (this) {
    ProjectPlatform.flutter => 'Flutter',
    ProjectPlatform.android => 'Android',
  };
}
