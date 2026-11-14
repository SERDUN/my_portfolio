import 'package:domain/domain.dart';

/// How a language names itself, the same in every UI language: what the
/// language switches of both presenters read out.
extension LanguageName on Language {
  String get nativeName => switch (this) {
    Language.en => 'English',
    Language.uk => 'Українська',
  };
}
