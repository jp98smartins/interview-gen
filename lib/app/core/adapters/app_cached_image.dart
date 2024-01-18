import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel/app/core/theme/app_colors.dart';

/// This class is a wrapper to handle the image rendering with cache.
///
/// Using this images that were loaded into the memory will be in cache for a small
/// period of time, and while they're there they'll render without loading.
///
/// This is a wrapper of [`cached_network_image`](https://pub.dev/packages/cached_network_image) library.
class AppCacheImage {
  static Widget url(
    String path, {
    Key? key,
    double? height,
    double? width,
    Color? color,
    String? errorPath,
    AlignmentGeometry alignment = Alignment.center,
    BoxFit fit = BoxFit.contain,
  }) {
    return Hero(
      tag: Key('AppCacheImage#$path'),
      child: CachedNetworkImage(
        key: key,
        imageUrl: path,
        fit: fit,
        width: width,
        height: height,
        filterQuality: FilterQuality.high,
        maxWidthDiskCache: width?.toInt() ?? 720,
        maxHeightDiskCache: height?.toInt() ?? 1080,
        fadeOutDuration: Duration.zero,
        fadeInDuration: const Duration(seconds: 1),
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return SizedBox(
            width: width,
            height: height,
            child: const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: AppColors.secondary,
              ),
            ),
          );
        },
        errorWidget: (_, url, error) {
          return SizedBox(
            key: Key('AppCacheImage#Error#$url'),
            width: width,
            height: height,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.error,
                  size: 36,
                ),
                SizedBox(height: 24),
                Text('Não foi possível carregar o poster!'),
              ],
            ),
          );
        },
      ),
    );
  }
}
