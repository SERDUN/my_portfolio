/// Languages the portfolio content exists in. This is the type boundary for
/// locale: the UI resolves a code with [fromCode] once, and nothing below
/// needs a fallback or a string comparison.
enum Language {
  en('en'),
  uk('uk');

  const Language(this.code);

  /// ISO 639-1 code, what the assets, the API and the UI locale use.
  final String code;

  static const Language fallback = en;

  /// Resolves "uk", "uk-UA", "UK_ua" to [uk]; anything unknown, including
  /// null, to [fallback].
  static Language fromCode(String? code) {
    if (code == null) return fallback;
    final base = code.toLowerCase().split(RegExp('[-_]')).first;
    return values.firstWhere((l) => l.code == base, orElse: () => fallback);
  }
}
