import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:marvel/app/core/theme/app_colors.dart';

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
    return Image.network(
      path,
      key: const Key('ListMoviesPage#SuccessBody#MovieCard#Poster'),
      height: height,
      width: width,
      filterQuality: FilterQuality.medium,
      cacheHeight: height.toInt(),
      cacheWidth: width.toInt(),
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          key: const Key(
            'ListMoviesPage#SuccessBody#MovieCard#PosterError',
          ),
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
      loadingBuilder: (context, child, loading) {
        if (loading?.cumulativeBytesLoaded != loading?.expectedTotalBytes) {
          return SizedBox(
            width: width,
            height: height,
            child: const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: AppColors.secondary,
              ),
            ),
          );
        }

        return child.animate().fadeIn(
              duration: const Duration(seconds: 1),
            );
      },
    );
  }
}
