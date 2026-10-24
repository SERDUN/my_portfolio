import 'package:flutter/services.dart';

import 'package:domain/domain.dart';

import 'assets.gen.dart';

/// Bundled JSON per [Language]. An exhaustive switch instead of a map: a
/// language added to the enum without its assets fails to compile.
extension AssetsDataGenExtension on $AssetsDataGen {
  Future<String> _getBundle(String path) => rootBundle.loadString('packages/data/$path');

  Future<String> contact(Language language) => _getBundle(switch (language) {
        Language.en => en.contact,
        Language.uk => uk.contact,
      });

  Future<String> projects(Language language) => _getBundle(switch (language) {
        Language.en => en.projects,
        Language.uk => uk.projects,
      });

  Future<String> skills(Language language) => _getBundle(switch (language) {
        Language.en => en.skills,
        Language.uk => uk.skills,
      });

  Future<String> usefulCommands(Language language) => _getBundle(switch (language) {
        Language.en => en.usefulCommands,
        Language.uk => uk.usefulCommands,
      });

  Future<String> user(Language language) => _getBundle(switch (language) {
        Language.en => en.user,
        Language.uk => uk.user,
      });
}
