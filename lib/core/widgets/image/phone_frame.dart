import 'package:material_ui/material_ui.dart';

import 'package:octo_image/octo_image.dart';

import 'package:my_portfolio/style/style.dart';

import 'blur_hash_placeholder.dart';

/// A phone screenshot rising out of a soft-colored well: dark bezel, rounded
/// top corners, clipped at the bottom of the well. The look of every project
/// card and the project hero.
class PhoneFrame extends StatelessWidget {
  const PhoneFrame({
    super.key,
    required this.imageUrl,
    this.height = 300,
    this.phoneWidth = 220,
    this.bezel = 6,
    this.radius = 22,
    this.wellRadius = 18,
    this.topInset = 28,
    this.semanticLabel,
  });

  final String? imageUrl;
  final double height;
  final double phoneWidth;
  final double bezel;
  final double radius;
  final double wellRadius;
  final double topInset;
  final String? semanticLabel;

  static const String _blurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final url = imageUrl;
    return ClipRRect(
      borderRadius: BorderRadius.circular(wellRadius),
      child: Container(
        height: height,
        color: palette.accentSoft,
        padding: EdgeInsets.only(top: topInset, left: 24, right: 24),
        alignment: Alignment.topCenter,
        child: Container(
          width: phoneWidth,
          decoration: BoxDecoration(
            color: palette.ink,
            borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
            boxShadow: [
              BoxShadow(
                color: palette.ink.withValues(alpha: 0.18),
                blurRadius: 40,
                offset: const Offset(0, 24),
              ),
            ],
          ),
          padding: EdgeInsets.only(top: bezel, left: bezel, right: bezel),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(radius - bezel)),
            child: url == null || url.isEmpty
                ? Container(color: palette.chip)
                : Semantics(
                    image: true,
                    label: semanticLabel,
                    child: OctoImage(
                      image: Image.network(url).image,
                      placeholderBuilder: blurHashPlaceholderBuilder(_blurHash),
                      errorBuilder: OctoError.icon(color: palette.muted),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      height: height,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
