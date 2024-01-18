import 'package:flutter/material.dart';
import 'package:marvel/app/core/adapters/app_cached_image.dart';

class MoviePosterComponent extends StatelessWidget {
  final double height;
  final String path;
  final double width;

  const MoviePosterComponent({
    super.key,
    required this.height,
    required this.path,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AppCacheImage.url(
      path,
      key: Key('MoviePosterComponent#$path'),
      height: height,
      width: width,
    );
  }
}
