import 'dart:developer' as developer;

/// An absolute http(s) URI from a data string; null for null or blank.
/// Anything else (relative paths, other schemes) is dropped and logged, so a
/// broken link in the data shows up in the console instead of vanishing.
Uri? parseWebUri(String? value, {String field = 'link'}) {
  final text = value?.trim() ?? '';
  if (text.isEmpty) return null;
  final uri = Uri.tryParse(text);
  if (uri != null && (uri.isScheme('http') || uri.isScheme('https')) && uri.host.isNotEmpty) return uri;
  developer.log('dropped $field "$text": not an absolute http(s) URL', name: 'data');
  return null;
}
