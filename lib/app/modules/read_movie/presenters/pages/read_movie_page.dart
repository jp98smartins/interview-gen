import 'package:flutter/material.dart';
import 'package:marvel/app/core/adapters/app_svg.dart';
import 'package:marvel/app/core/components/movie_poster_component.dart';
import 'package:marvel/app/core/extensions/date_time_extensions.dart';
import 'package:marvel/app/core/theme/app_colors.dart';
import 'package:marvel/app/core/theme/app_fonts.dart';
import 'package:marvel/app/core/theme/app_icons.dart';
import 'package:marvel/app/modules/list_movies/domain/entities/movie_entity.dart';

final class ReadMoviePage extends StatelessWidget {
  final MovieEntity movie;

  const ReadMoviePage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final posterWidth = (MediaQuery.sizeOf(context).width / 1.5) - 48;
    final posterHeight = posterWidth * 3 / 2;

    return Scaffold(
      key: const Key('ListMoviesPage'),
      appBar: AppBar(
        key: const Key('ListMoviesPage#AppBar'),
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: BackButton(
            color: AppColors.onBackground,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        centerTitle: true,
        title: Hero(
          tag: 'AppBarLogoHeroKey',
          transitionOnUserGestures: true,
          child: AppSvg.asset(
            AppIcons.logo,
            key: const Key('ListMoviesPage#AppBar#Title'),
            height: 35,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: MoviePosterComponent(
                  height: posterHeight,
                  path: movie.poster,
                  width: posterWidth,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.onBackground,
                  fontFamily: AppFonts.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: movie.voteAverage.toStringAsFixed(1),
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontFamily: AppFonts.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const TextSpan(
                    text: '/10',
                    style: TextStyle(
                      color: AppColors.onBackground,
                      fontFamily: AppFonts.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 24,
                    runSpacing: 16,
                    children: movie.genres
                        .map(
                          (genre) => Text(
                            genre,
                            style: const TextStyle(
                              color: AppColors.onPrimary,
                              fontFamily: AppFonts.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sinopse',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontFamily: AppFonts.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                movie.overview,
                style: const TextStyle(
                  color: AppColors.onPrimary,
                  fontFamily: AppFonts.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  movie.releaseDate.toStringDate(),
                  style: TextStyle(
                    color: AppColors.secondary.withOpacity(0.9),
                    fontFamily: AppFonts.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
