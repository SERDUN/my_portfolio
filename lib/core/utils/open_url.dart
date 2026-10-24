import 'package:url_launcher/url_launcher.dart';

/// The schemes the site may hand to the browser. One rule for every link,
/// whether it came as a Uri (projects, CV) or as text (contacts).
const Set<String> _openableSchemes = {'http', 'https', 'mailto'};

bool isOpenable(Uri? uri) => uri != null && _openableSchemes.contains(uri.scheme.toLowerCase());

/// Opens [uri] in a new tab. Returns false when it is missing, uses another
/// scheme, or the launch fails; callers decide whether to tell the user.
Future<bool> openUri(Uri? uri) async {
  if (!isOpenable(uri)) return false;
  return launchUrl(uri!, mode: LaunchMode.externalApplication);
}

/// [openUri] for a link that arrives as text (contact values).
Future<bool> openExternalUrl(String? link) => openUri(Uri.tryParse(link?.trim() ?? ''));
