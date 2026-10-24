import 'package:url_launcher/url_launcher.dart';

/// Opens [link] in a new tab. Returns false when the link cannot be parsed
/// or launched; callers decide whether that is worth telling the user.
Future<bool> openExternalUrl(String? link) async {
  final uri = Uri.tryParse(link ?? '');
  if (uri == null || !uri.hasScheme) return false;
  return launchUrl(uri, mode: LaunchMode.externalApplication);
}

/// Builds a mailto link for an address so it can go through [openExternalUrl].
String mailto(String address) => 'mailto:$address';
