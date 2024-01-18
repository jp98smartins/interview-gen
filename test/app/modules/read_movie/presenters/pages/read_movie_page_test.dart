import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/components/movie_poster_component.dart';
import 'package:marvel/app/core/extensions/date_time_extension.dart';
import 'package:marvel/app/core/theme/app_colors.dart';
import 'package:marvel/app/core/theme/app_fonts.dart';
import 'package:marvel/app/modules/read_movie/domain/mocks/read_movie_mock.dart';
import 'package:marvel/app/modules/read_movie/presenters/pages/read_movie_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  const pageKey = Key('ReadMoviePage');
  const appBarKey = Key('ReadMoviePage#AppBar');
  const appBarTitleKey = Key('ReadMoviePage#AppBar#Title');
  const posterKey = Key('ReadMoviePage#Poster');
  const titleKey = Key('ReadMoviePage#Title');
  const scoreKey = Key('ReadMoviePage#Score');
  const genresKey = Key('ReadMoviePage#Genres');
  const sinopseKey = Key('ReadMoviePage#Sinopse');
  const overviewKey = Key('ReadMoviePage#Overview');
  const releaseDateKey = Key('ReadMoviePage#ReleaseDate');

  group(
    'Widgets |',
    () {
      testWidgets(
        'Success | Should build the page structure correctly',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: ReadMoviePage(movie: movie),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          expect(find.byKey(pageKey), findsOneWidget);
          expect(find.byKey(appBarKey), findsOneWidget);
          final logoFinder = find.byKey(appBarTitleKey);
          final logoWidget = tester.firstWidget(logoFinder) as SvgPicture;
          expect(logoFinder, findsOneWidget);
          expect(logoWidget.height, equals(35));
        },
      );

      testWidgets(
        'Success | Should build the movie poster',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: ReadMoviePage(movie: movie),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(posterKey);
          final widget = tester.firstWidget(finder) as MoviePosterComponent;
          expect(finder, findsOneWidget);
          expect(widget.path, equals(movie.poster));
        },
      );

      testWidgets(
        'Success | Should build the movie title',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: ReadMoviePage(movie: movie),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(titleKey);
          final widget = tester.firstWidget(finder) as Text;
          expect(finder, findsOneWidget);
          expect(widget.data, equals(movie.title));
          expect(widget.textAlign, equals(TextAlign.center));
          expect(widget.style?.color, equals(AppColors.onBackground));
          expect(widget.style?.fontFamily, equals(AppFonts.primary));
          expect(widget.style?.fontSize, equals(24));
          expect(widget.style?.fontWeight, equals(FontWeight.w800));
        },
      );

      testWidgets(
        'Success | Should build the movie score',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: ReadMoviePage(movie: movie),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(scoreKey);
          final scoreWidget =
              (tester.firstWidget(finder) as RichText).text as TextSpan;
          final movieScoreWidget = scoreWidget.children?[0] as TextSpan;
          final totalScoreWidget = scoreWidget.children?[1] as TextSpan;
          expect(finder, findsOneWidget);
          expect(
            movieScoreWidget.text,
            equals(movie.voteAverage.toStringAsFixed(1)),
          );
          expect(movieScoreWidget.style?.color, equals(AppColors.secondary));
          expect(movieScoreWidget.style?.fontFamily, equals(AppFonts.primary));
          expect(movieScoreWidget.style?.fontSize, equals(24));
          expect(movieScoreWidget.style?.fontWeight, equals(FontWeight.w900));
          expect(totalScoreWidget.text, equals('/10'));
          expect(totalScoreWidget.style?.color, equals(AppColors.onBackground));
          expect(totalScoreWidget.style?.fontFamily, equals(AppFonts.primary));
          expect(totalScoreWidget.style?.fontSize, equals(16));
          expect(totalScoreWidget.style?.fontWeight, equals(FontWeight.w900));
        },
      );

      testWidgets(
        'Success | Should build the movie genres',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: ReadMoviePage(movie: movie),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(genresKey);
          final widget = tester.firstWidget(finder) as DecoratedBox;
          expect(finder, findsOneWidget);
          expect(
            (widget.decoration as BoxDecoration).color,
            equals(AppColors.primary),
          );
          expect(
            (widget.decoration as BoxDecoration).borderRadius,
            equals(BorderRadius.circular(12)),
          );
          final paddingWidget = widget.child as Padding;
          expect(
            paddingWidget.padding,
            equals(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
          );
          final wrapWidget = paddingWidget.child as Wrap;
          expect(wrapWidget.alignment, equals(WrapAlignment.center));
          expect(
            wrapWidget.crossAxisAlignment,
            equals(WrapCrossAlignment.center),
          );
          expect(wrapWidget.runAlignment, equals(WrapAlignment.center));
          expect(wrapWidget.spacing, equals(24));
          expect(wrapWidget.runSpacing, equals(16));
          final genresWidget = wrapWidget.children as List<Text>;
          expect(genresWidget.first.data, equals(movie.genres.first));
          expect(genresWidget.first.style?.color, equals(AppColors.onPrimary));
          expect(
            genresWidget.first.style?.fontFamily,
            equals(AppFonts.primary),
          );
          expect(genresWidget.first.style?.fontSize, equals(16));
          expect(genresWidget.first.style?.fontWeight, equals(FontWeight.w600));
        },
      );

      testWidgets(
        'Success | Should build the movie sinopse',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: ReadMoviePage(movie: movie),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(sinopseKey);
          final widget = tester.firstWidget(finder) as Text;
          expect(finder, findsOneWidget);
          expect(widget.data, equals('Sinopse'));
          expect(widget.style?.color, equals(AppColors.secondary));
          expect(widget.style?.fontFamily, equals(AppFonts.primary));
          expect(widget.style?.fontSize, equals(16));
          expect(widget.style?.fontWeight, equals(FontWeight.w700));
        },
      );

      testWidgets(
        'Success | Should build the movie overview',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: ReadMoviePage(movie: movie),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(overviewKey);
          final widget = tester.firstWidget(finder) as Text;
          expect(finder, findsOneWidget);
          expect(widget.data, equals(movie.overview));
          expect(widget.style?.color, equals(AppColors.onPrimary));
          expect(widget.style?.fontFamily, equals(AppFonts.primary));
          expect(widget.style?.fontSize, equals(14));
          expect(widget.style?.fontWeight, equals(FontWeight.w500));
        },
      );

      testWidgets(
        'Success | Should build the movie release date',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: ReadMoviePage(movie: movie),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(releaseDateKey);
          final widget = tester.firstWidget(finder) as Text;
          expect(finder, findsOneWidget);
          expect(widget.data, equals(movie.releaseDate.toStringDate()));
          expect(
            widget.style?.color,
            equals(AppColors.secondary.withOpacity(0.9)),
          );
          expect(widget.style?.fontFamily, equals(AppFonts.primary));
          expect(widget.style?.fontSize, equals(12));
          expect(widget.style?.fontWeight, equals(FontWeight.w500));
        },
      );
    },
  );
}
