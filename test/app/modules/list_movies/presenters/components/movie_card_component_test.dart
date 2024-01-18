import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/core/components/movie_poster_component.dart';
import 'package:marvel/app/core/extensions/list_extension.dart';
import 'package:marvel/app/core/theme/app_colors.dart';
import 'package:marvel/app/core/theme/app_fonts.dart';
import 'package:marvel/app/modules/list_movies/presenters/components/movie_card_component.dart';
import 'package:marvel/app/modules/read_movie/domain/mocks/read_movie_mock.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  const componentKey = Key('MovieCardComponent');
  const cardKey = Key('MovieCardComponent#Card');
  const posterKey = Key('MovieCardComponent#Card#Poster');
  const genresKey = Key('MovieCardComponent#Card#Genres');

  group(
    'Widgets |',
    () {
      testWidgets(
        'Success | Should build the component structure correctly',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: MovieCardComponent(movie: movie),
                ),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(componentKey);
          final widget = tester.firstWidget(finder) as Padding;
          expect(finder, findsOneWidget);
          expect(
            widget.padding,
            equals(const EdgeInsets.fromLTRB(24, 24, 24, 0)),
          );
          final inkWellWidget = widget.child as InkWell;
          expect(inkWellWidget.onTap, isNotNull);
        },
      );

      testWidgets(
        'Success | Should build the movie card',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: MovieCardComponent(movie: movie),
                ),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(cardKey);
          final widget = tester.firstWidget(finder) as Card;
          expect(finder, findsOneWidget);
          expect(widget.color, equals(AppColors.primary));
          expect(widget.elevation, equals(0));
          expect(widget.margin, equals(EdgeInsets.zero));
          expect(widget.clipBehavior, equals(Clip.hardEdge));
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
                home: Scaffold(
                  body: MovieCardComponent(movie: movie),
                ),
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
        'Success | Should build the movie genres',
        (tester) async {
          // Arrange
          final movie = ReadMovieMock.movie;

          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: MovieCardComponent(movie: movie),
                ),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final finder = find.byKey(genresKey);
          final widget = tester.firstWidget(finder) as Positioned;
          expect(finder, findsOneWidget);
          expect(widget.bottom, equals(0));
          expect(widget.left, equals(0));
          expect(widget.right, equals(0));
          final backgroundWidget =
              (widget.child as FadeTransition).child as DecoratedBox;
          final backgroundDecorationWidget =
              backgroundWidget.decoration as BoxDecoration;
          expect(
            backgroundDecorationWidget.borderRadius,
            equals(
              const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          );
          final backgroundGradientWidget =
              backgroundDecorationWidget.gradient as LinearGradient;
          expect(backgroundGradientWidget.begin, equals(Alignment.topCenter));
          expect(backgroundGradientWidget.end, equals(Alignment.bottomCenter));
          expect(
            backgroundGradientWidget.colors,
            equals(
              [
                AppColors.secondary.withOpacity(0.0),
                AppColors.secondary.withOpacity(0.5),
                AppColors.secondary.withOpacity(0.8),
                AppColors.secondary.withOpacity(1.0),
              ],
            ),
          );
          final baseGenresWidget = backgroundWidget.child as Padding;
          expect(baseGenresWidget.padding, equals(const EdgeInsets.all(16.0)));
          final alignmentWidget = baseGenresWidget.child as Align;
          expect(alignmentWidget.alignment, equals(Alignment.bottomLeft));
          final genresTextWidget = (alignmentWidget.child as Animate).child as Text;
          expect(genresTextWidget.data, equals(movie.genres.items));
          expect(genresTextWidget.maxLines, equals(1));
          expect(genresTextWidget.softWrap, equals(true));
          expect(genresTextWidget.overflow, equals(TextOverflow.ellipsis));
          expect(genresTextWidget.style?.color, equals(AppColors.onSecondary));
          expect(genresTextWidget.style?.fontFamily, equals(AppFonts.primary));
          expect(genresTextWidget.style?.fontSize, equals(14));
          expect(genresTextWidget.style?.fontWeight, equals(FontWeight.w600));
        },
      );
    },
  );
}
