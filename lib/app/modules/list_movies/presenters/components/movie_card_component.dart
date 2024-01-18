import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:marvel/app/core/components/movie_poster_component.dart';
import 'package:marvel/app/core/extensions/key_entension.dart';
import 'package:marvel/app/core/extensions/list_extension.dart';
import 'package:marvel/app/core/routes/app_routes.dart';
import 'package:marvel/app/core/theme/app_colors.dart';
import 'package:marvel/app/core/theme/app_fonts.dart';
import 'package:marvel/app/modules/list_movies/domain/entities/movie_entity.dart';

final class MovieCardComponent extends StatelessWidget {
  final MovieEntity movie;

  const MovieCardComponent({
    super.key,
    required this.movie,
  });

  TextStyle get genresTextStyle {
    return const TextStyle(
      color: AppColors.onSecondary,
      fontFamily: AppFonts.primary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  @override
  Widget build(BuildContext context) {
    final posterWidth = MediaQuery.sizeOf(context).width - 48;
    final posterHeight = posterWidth * 3 / 2;
    return Padding(
      key: key != null
          ? Key('${key.value}#MovieCardComponent')
          : const Key('MovieCardComponent'),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: InkWell(
        key: key != null
            ? Key('${key.value}#MovieCardComponent#InkWell')
            : const Key('MovieCardComponent#InkWell'),
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutes.readMovie,
          arguments: movie,
        ),
        child: Stack(
          children: [
            Card(
              key: key != null
                  ? Key('${key.value}#MovieCardComponent#Card')
                  : const Key('MovieCardComponent#Card'),
              color: AppColors.primary,
              elevation: 0,
              margin: EdgeInsets.zero,
              clipBehavior: Clip.hardEdge,
              child: MoviePosterComponent(
                key: key != null
                    ? Key('${key.value}#MovieCardComponent#Card#Poster')
                    : const Key('MovieCardComponent#Card#Poster'),
                height: posterHeight,
                path: movie.poster,
                width: posterWidth,
              ).animate().fadeIn(
                    duration: const Duration(seconds: 1),
                  ),
            ),
            if (movie.genres.isNotEmpty)
              Positioned(
                key: key != null
                    ? Key('${key.value}#MovieCardComponent#Card#Genres')
                    : const Key('MovieCardComponent#Card#Genres'),
                bottom: 0,
                left: 0,
                right: 0,
                height: posterHeight * 0.15,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.secondary.withOpacity(0.0),
                        AppColors.secondary.withOpacity(0.5),
                        AppColors.secondary.withOpacity(0.8),
                        AppColors.secondary.withOpacity(1.0),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        movie.genres.items,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: genresTextStyle,
                      ).animate().slideX(
                            begin: -2,
                            delay: const Duration(seconds: 1),
                            duration: const Duration(seconds: 1),
                          ),
                    ),
                  ),
                ),
              ).animate().fadeIn(
                    delay: const Duration(seconds: 1),
                    duration: const Duration(seconds: 1),
                  ),
          ],
        ),
      ),
    );
  }
}
