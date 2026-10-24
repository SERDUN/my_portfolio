import 'package:material_ui/material_ui.dart';

import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';

/// BlurHash placeholder for [OctoImage]. Replaces `OctoPlaceholder.blurHash`,
/// which octo_image 2.x no longer ships.
OctoPlaceholderBuilder blurHashPlaceholderBuilder(String hash, {BoxFit? fit}) {
  return (context) => SizedBox.expand(
    child: Image(image: BlurHashImage(hash), fit: fit ?? BoxFit.cover),
  );
}

/// BlurHash error widget for [OctoImage]: the blurred placeholder with an
/// error icon on top.
OctoErrorBuilder blurHashErrorBuilder(
  String hash, {
  BoxFit? fit,
  Text? message,
  IconData? icon,
  Color? iconColor,
  double? iconSize,
}) {
  return OctoError.placeholderWithErrorIcon(
    blurHashPlaceholderBuilder(hash, fit: fit),
    message: message,
    icon: icon,
    iconColor: iconColor,
    iconSize: iconSize,
  );
}
