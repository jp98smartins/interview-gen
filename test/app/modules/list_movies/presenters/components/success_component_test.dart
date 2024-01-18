import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/app/modules/list_movies/data/mappers/movies_list_mapper.dart';
import 'package:marvel/app/modules/list_movies/domain/mocks/list_movies_mock.dart';
import 'package:marvel/app/modules/list_movies/presenters/components/movie_card_component.dart';
import 'package:marvel/app/modules/list_movies/presenters/components/success_component.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  // Arrange
  const successWidgetKey = Key('ListMoviesPage#SuccessBody');
  final moviesList = MoviesListMapper.fromMap(ListMoviesMock.filledList);
  final moviesKeys = moviesList.movies
      .map((movie) => Key("MovieCardComponent#${movie.id}"))
      .toList();

  group(
    'Widgets |',
    () {
      testWidgets(
        'Success | Should build the component structure correctly',
        (tester) async {
          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: SuccessComponent(moviesList: moviesList),
                ),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          expect(find.byKey(successWidgetKey), findsOneWidget);
          expect(find.byKey(moviesKeys.first), findsOneWidget);
        },
      );

      testWidgets(
        'Success | Should build all the movies correctly',
        (tester) async {
          // Act
          await mockNetworkImagesFor(
            () async => await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: SuccessComponent(moviesList: moviesList),
                ),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          final firstFinder = find.byKey(moviesKeys.first);
          final firstWidget =
              tester.firstWidget(firstFinder) as MovieCardComponent;
          expect(firstFinder, findsOneWidget);
          expect(firstWidget.movie.id, moviesList.movies.first.id);
          final lastFinder = find.byKey(moviesKeys.last);
          expect(lastFinder, findsNothing);

          // Act
          await tester.scrollUntilVisible(
            lastFinder,
            10000,
          );
          await tester.pump(const Duration(seconds: 10));

          // Assert
          expect(firstFinder, findsNothing);
          expect(lastFinder, findsOneWidget);
          final lastWidget =
              tester.firstWidget(lastFinder) as MovieCardComponent;
          expect(lastWidget.movie.id, moviesList.movies.last.id);
          await tester.pump(const Duration(seconds: 10));
        },
      );
    },
  );
}
