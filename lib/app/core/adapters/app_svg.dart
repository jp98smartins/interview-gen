import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// This class is a wrapper to handle the svg rendering.
///
/// This is a wrapper of [`flutter_svg`](https://pub.dev/packages/flutter_svg) library.
sealed class AppSvg {
  static Widget asset(
    String assetPath, {
    Key? key,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    SvgTheme? theme,
    ColorFilter? colorFilter,
  }) {
    return SvgPicture.asset(
      assetPath,
      key: key,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      theme: theme,
      colorFilter: colorFilter,
    );
  }
}
