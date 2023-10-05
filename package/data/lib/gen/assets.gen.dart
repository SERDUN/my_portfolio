/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsDataGen {
  const $AssetsDataGen();

  $AssetsDataEnGen get en => const $AssetsDataEnGen();
  $AssetsDataUkGen get uk => const $AssetsDataUkGen();
}

class $AssetsDataEnGen {
  const $AssetsDataEnGen();

  /// File path: assets/data/en/contact.json
  String get contact => 'assets/data/en/contact.json';

  /// File path: assets/data/en/projects.json
  String get projects => 'assets/data/en/projects.json';

  /// File path: assets/data/en/skills.json
  String get skills => 'assets/data/en/skills.json';

  /// File path: assets/data/en/useful_commands.json
  String get usefulCommands => 'assets/data/en/useful_commands.json';

  /// File path: assets/data/en/user.json
  String get user => 'assets/data/en/user.json';

  /// List of all assets
  List<String> get values => [contact, projects, skills, usefulCommands, user];
}

class $AssetsDataUkGen {
  const $AssetsDataUkGen();

  /// File path: assets/data/uk/contact.json
  String get contact => 'assets/data/uk/contact.json';

  /// File path: assets/data/uk/projects.json
  String get projects => 'assets/data/uk/projects.json';

  /// File path: assets/data/uk/skills.json
  String get skills => 'assets/data/uk/skills.json';

  /// File path: assets/data/uk/useful_commands.json
  String get usefulCommands => 'assets/data/uk/useful_commands.json';

  /// File path: assets/data/uk/user.json
  String get user => 'assets/data/uk/user.json';

  /// List of all assets
  List<String> get values => [contact, projects, skills, usefulCommands, user];
}

class Assets {
  Assets._();

  static const $AssetsDataGen data = $AssetsDataGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
